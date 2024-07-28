if (!("finalizeConstruction" in ViewPU.prototype)) {
    Reflect.set(ViewPU.prototype, "finalizeConstruction", () => { });
}
interface MyPage_Params {
    a?: number;
    b?: number;
    message?: string;
}
interface HomePage_Params {
    arr?: number[];
}
interface StorePage_Params {
}
interface MainPage_Params {
    mCurrentPage?: number;
    mIndex?: number;
    mTabController?: TabsController;
}
export class MainPage extends ViewPU {
    constructor(parent, params, __localStorage, elmtId = -1, paramsLambda = undefined, extraInfo) {
        super(parent, __localStorage, elmtId, extraInfo);
        if (typeof paramsLambda === "function") {
            this.paramsGenerator_ = paramsLambda;
        }
        this.__mCurrentPage = new ObservedPropertySimplePU(0, this, "mCurrentPage");
        this.mIndex = 0;
        this.mTabController = new TabsController();
        this.setInitiallyProvidedValue(params);
        this.finalizeConstruction();
    }
    setInitiallyProvidedValue(params: MainPage_Params) {
        if (params.mCurrentPage !== undefined) {
            this.mCurrentPage = params.mCurrentPage;
        }
        if (params.mIndex !== undefined) {
            this.mIndex = params.mIndex;
        }
        if (params.mTabController !== undefined) {
            this.mTabController = params.mTabController;
        }
    }
    updateStateVars(params: MainPage_Params) {
    }
    purgeVariableDependenciesOnElmtId(rmElmtId) {
        this.__mCurrentPage.purgeDependencyOnElmtId(rmElmtId);
    }
    aboutToBeDeleted() {
        this.__mCurrentPage.aboutToBeDeleted();
        SubscriberManager.Get().delete(this.id__());
        this.aboutToBeDeletedInternal();
    }
    private __mCurrentPage: ObservedPropertySimplePU<number>;
    get mCurrentPage() {
        return this.__mCurrentPage.get();
    }
    set mCurrentPage(newValue: number) {
        this.__mCurrentPage.set(newValue);
    }
    private mIndex: number;
    private mTabController: TabsController;
    initialRender() {
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            //Pages entry
            Tabs.create({ barPosition: BarPosition.End, controller: this.mTabController });
            Tabs.debugLine("entry/src/main/ets/pages/Index.ets(9:5)");
            //Pages entry
            Tabs.scrollable(true);
            //Pages entry
            Tabs.vertical(false);
            //Pages entry
            Tabs.barMode(BarMode.Fixed);
            //Pages entry
            Tabs.onChange((index) => {
                this.mCurrentPage = index;
            });
        }, Tabs);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            TabContent.create(() => {
                {
                    this.observeComponentCreation2((elmtId, isInitialRender) => {
                        if (isInitialRender) {
                            let componentCall = new HomePage(this, {}, undefined, elmtId, () => { }, { page: "entry/src/main/ets/pages/Index.ets", line: 12 });
                            ViewPU.create(componentCall);
                            let paramsLambda = () => {
                                return {};
                            };
                            componentCall.paramsGenerator_ = paramsLambda;
                        }
                        else {
                            this.updateStateVarsOfChildByElmtId(elmtId, {});
                        }
                    }, { name: "HomePage" });
                }
            });
            TabContent.tabBar({ builder: () => {
                    this.TabBuilder.call(this, 0, '首页', { "id": 16777228, "type": 20000, params: [], "bundleName": "com.example.myapplication", "moduleName": "entry" }, { "id": 16777233, "type": 20000, params: [], "bundleName": "com.example.myapplication", "moduleName": "entry" });
                } });
            TabContent.debugLine("entry/src/main/ets/pages/Index.ets(11:7)");
        }, TabContent);
        TabContent.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            TabContent.create(() => {
                {
                    this.observeComponentCreation2((elmtId, isInitialRender) => {
                        if (isInitialRender) {
                            let componentCall = new StorePage(this, {}, undefined, elmtId, () => { }, { page: "entry/src/main/ets/pages/Index.ets", line: 17 });
                            ViewPU.create(componentCall);
                            let paramsLambda = () => {
                                return {};
                            };
                            componentCall.paramsGenerator_ = paramsLambda;
                        }
                        else {
                            this.updateStateVarsOfChildByElmtId(elmtId, {});
                        }
                    }, { name: "StorePage" });
                }
            });
            TabContent.tabBar({ builder: () => {
                    this.TabBuilder.call(this, 1, '商城', { "id": 16777226, "type": 20000, params: [], "bundleName": "com.example.myapplication", "moduleName": "entry" }, { "id": 16777219, "type": 20000, params: [], "bundleName": "com.example.myapplication", "moduleName": "entry" });
                } });
            TabContent.debugLine("entry/src/main/ets/pages/Index.ets(16:7)");
        }, TabContent);
        TabContent.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            TabContent.create(() => {
                {
                    this.observeComponentCreation2((elmtId, isInitialRender) => {
                        if (isInitialRender) {
                            let componentCall = new MyPage(this, {}, undefined, elmtId, () => { }, { page: "entry/src/main/ets/pages/Index.ets", line: 22 });
                            ViewPU.create(componentCall);
                            let paramsLambda = () => {
                                return {};
                            };
                            componentCall.paramsGenerator_ = paramsLambda;
                        }
                        else {
                            this.updateStateVarsOfChildByElmtId(elmtId, {});
                        }
                    }, { name: "MyPage" });
                }
            });
            TabContent.tabBar({ builder: () => {
                    this.TabBuilder.call(this, 2, '我的', { "id": 16777227, "type": 20000, params: [], "bundleName": "com.example.myapplication", "moduleName": "entry" }, { "id": 16777234, "type": 20000, params: [], "bundleName": "com.example.myapplication", "moduleName": "entry" });
                } });
            TabContent.debugLine("entry/src/main/ets/pages/Index.ets(21:7)");
        }, TabContent);
        TabContent.pop();
        //Pages entry
        Tabs.pop();
    }
    //Customize navigation bar
    TabBuilder(index: number, name: string, image_raw: Resource, image_selected: Resource, parent = null) {
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Column.create();
            Column.debugLine("entry/src/main/ets/pages/Index.ets(38:5)");
            Column.justifyContent(FlexAlign.Center);
        }, Column);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Image.create(this.mCurrentPage === index ? image_selected : image_raw);
            Image.debugLine("entry/src/main/ets/pages/Index.ets(39:7)");
            Image.width('24vp');
            Image.height('24vp');
            Image.objectFit(ImageFit.Contain);
        }, Image);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Text.create(name);
            Text.debugLine("entry/src/main/ets/pages/Index.ets(43:7)");
            Text.fontSize(15);
            Text.fontWeight(500);
            Text.fontColor(this.mCurrentPage === index ? '#000000' : '#999999');
            Text.margin({ top: '4vp' });
        }, Text);
        Text.pop();
        Column.pop();
    }
    rerender() {
        this.updateDirtyElements();
    }
    static getEntryName(): string {
        return "MainPage";
    }
}
class StorePage extends ViewPU {
    constructor(parent, params, __localStorage, elmtId = -1, paramsLambda = undefined, extraInfo) {
        super(parent, __localStorage, elmtId, extraInfo);
        if (typeof paramsLambda === "function") {
            this.paramsGenerator_ = paramsLambda;
        }
        this.setInitiallyProvidedValue(params);
        this.finalizeConstruction();
    }
    setInitiallyProvidedValue(params: StorePage_Params) {
    }
    updateStateVars(params: StorePage_Params) {
    }
    purgeVariableDependenciesOnElmtId(rmElmtId) {
    }
    aboutToBeDeleted() {
        SubscriberManager.Get().delete(this.id__());
        this.aboutToBeDeletedInternal();
    }
    initialRender() {
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Column.create();
            Column.debugLine("entry/src/main/ets/pages/Index.ets(56:5)");
            Column.width('100%');
            Column.height('90%');
        }, Column);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Text.create('精品推荐');
            Text.debugLine("entry/src/main/ets/pages/Index.ets(57:7)");
            Text.fontSize(35);
        }, Text);
        Text.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            List.create({ space: 20, initialIndex: 0 });
            List.debugLine("entry/src/main/ets/pages/Index.ets(59:7)");
            List.width('80%');
        }, List);
        // Using list component to display series infomation
        this.Single_Info.bind(this)({ "id": 16777232, "type": 20000, params: [], "bundleName": "com.example.myapplication", "moduleName": "entry" }, "HONOR Magic v2 RSR", 1, '12999', '11999', this);
        this.Single_Info.bind(this)({ "id": 16777222, "type": 20000, params: [], "bundleName": "com.example.myapplication", "moduleName": "entry" }, 'HONOR MagicBook x16', 0, '6999', undefined, this);
        this.Single_Info.bind(this)({ "id": 16777221, "type": 20000, params: [], "bundleName": "com.example.myapplication", "moduleName": "entry" }, 'HONOR MagicPad 9', 0, '3999', undefined, this);
        this.Single_Info.bind(this)({ "id": 16777229, "type": 20000, params: [], "bundleName": "com.example.myapplication", "moduleName": "entry" }, 'HONOR Watch 4', 1, '6999', '6799', this);
        this.Single_Info.bind(this)({ "id": 16777220, "type": 20000, params: [], "bundleName": "com.example.myapplication", "moduleName": "entry" }, 'HONOR Magic 6 Pro', 1, '5999', '5888', this);
        List.pop();
        Column.pop();
    }
    // Define one piece of info
    Single_Info(image: Resource, info: string, discount_status: number, price: string, after_discount?: string, parent = null) {
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Column.create({ space: 5 });
            Column.debugLine("entry/src/main/ets/pages/Index.ets(72:7)");
            Column.backgroundColor('#eeeeee');
            Column.alignItems(HorizontalAlign.Start);
            Column.justifyContent(FlexAlign.Center);
            Column.borderRadius(10);
        }, Column);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Row.create({ space: 20 });
            Row.debugLine("entry/src/main/ets/pages/Index.ets(73:9)");
            Row.width("100%");
            Row.margin(5);
        }, Row);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Image.create(image);
            Image.debugLine("entry/src/main/ets/pages/Index.ets(74:9)");
            Image.height('10%');
        }, Image);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Text.create(info);
            Text.debugLine("entry/src/main/ets/pages/Index.ets(76:9)");
            Text.fontSize(16);
        }, Text);
        Text.pop();
        Row.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            If.create();
            if (discount_status == 0) {
                this.ifElseBranchUpdateFunction(0, () => {
                    this.observeComponentCreation2((elmtId, isInitialRender) => {
                        Text.create('售价: ' + price);
                        Text.debugLine("entry/src/main/ets/pages/Index.ets(81:11)");
                        Text.fontSize(15);
                        Text.fontColor('#111111');
                        Text.margin(5);
                    }, Text);
                    Text.pop();
                });
            }
            else {
                this.ifElseBranchUpdateFunction(1, () => {
                    this.observeComponentCreation2((elmtId, isInitialRender) => {
                        Text.create('原价：' + price);
                        Text.debugLine("entry/src/main/ets/pages/Index.ets(87:11)");
                        Text.fontSize(13);
                        Text.fontColor('#999999');
                        Text.fontStyle(FontStyle.Italic);
                        Text.decoration({ type: TextDecorationType.LineThrough, color: Color.Gray });
                        Text.margin(5);
                    }, Text);
                    Text.pop();
                    this.observeComponentCreation2((elmtId, isInitialRender) => {
                        Text.create('活动价：' + after_discount);
                        Text.debugLine("entry/src/main/ets/pages/Index.ets(93:11)");
                        Text.fontSize(15);
                        Text.fontColor('#111111');
                        Text.fontWeight(FontWeight.Bold);
                        Text.margin(5);
                    }, Text);
                    Text.pop();
                });
            }
        }, If);
        If.pop();
        Column.pop();
    }
    rerender() {
        this.updateDirtyElements();
    }
}
class HomePage extends ViewPU {
    constructor(parent, params, __localStorage, elmtId = -1, paramsLambda = undefined, extraInfo) {
        super(parent, __localStorage, elmtId, extraInfo);
        if (typeof paramsLambda === "function") {
            this.paramsGenerator_ = paramsLambda;
        }
        this.arr = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13];
        this.setInitiallyProvidedValue(params);
        this.finalizeConstruction();
    }
    setInitiallyProvidedValue(params: HomePage_Params) {
        if (params.arr !== undefined) {
            this.arr = params.arr;
        }
    }
    updateStateVars(params: HomePage_Params) {
    }
    purgeVariableDependenciesOnElmtId(rmElmtId) {
    }
    aboutToBeDeleted() {
        SubscriberManager.Get().delete(this.id__());
        this.aboutToBeDeletedInternal();
    }
    private arr: number[];
    initialRender() {
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Column.create();
            Column.debugLine("entry/src/main/ets/pages/Index.ets(113:5)");
        }, Column);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Text.create('最新产品');
            Text.debugLine("entry/src/main/ets/pages/Index.ets(114:7)");
            Text.fontSize(30);
        }, Text);
        Text.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Grid.create();
            Grid.debugLine("entry/src/main/ets/pages/Index.ets(116:7)");
            Grid.rowsTemplate('1fr 1fr 1fr 1fr');
            Grid.columnsTemplate('1fr 1fr 1fr 1fr');
        }, Grid);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            ForEach.create();
            const forEachItemGenFunction = _item => {
                const item = _item;
                {
                    const itemCreation2 = (elmtId, isInitialRender) => {
                        GridItem.create(() => { }, false);
                        GridItem.debugLine("entry/src/main/ets/pages/Index.ets(118:11)");
                    };
                    const observedDeepRender = () => {
                        this.observeComponentCreation2(itemCreation2, GridItem);
                        this.observeComponentCreation2((elmtId, isInitialRender) => {
                            Text.create('产品：' + item);
                            Text.debugLine("entry/src/main/ets/pages/Index.ets(119:13)");
                            Text.width('80%');
                            Text.height(110);
                            Text.fontSize(16);
                            Text.textAlign(TextAlign.Center);
                            Text.borderRadius(10);
                            Text.backgroundColor(0xEEEEEE);
                        }, Text);
                        Text.pop();
                        GridItem.pop();
                    };
                    observedDeepRender();
                }
            };
            this.forEachUpdateFunction(elmtId, this.arr, forEachItemGenFunction);
        }, ForEach);
        ForEach.pop();
        Grid.pop();
        Column.pop();
    }
    rerender() {
        this.updateDirtyElements();
    }
}
class MyPage extends ViewPU {
    constructor(parent, params, __localStorage, elmtId = -1, paramsLambda = undefined, extraInfo) {
        super(parent, __localStorage, elmtId, extraInfo);
        if (typeof paramsLambda === "function") {
            this.paramsGenerator_ = paramsLambda;
        }
        this.__a = new ObservedPropertySimplePU(0, this, "a");
        this.__b = new ObservedPropertySimplePU(0, this, "b");
        this.__message = new ObservedPropertySimplePU('点下面的按钮', this, "message");
        this.setInitiallyProvidedValue(params);
        this.finalizeConstruction();
    }
    setInitiallyProvidedValue(params: MyPage_Params) {
        if (params.a !== undefined) {
            this.a = params.a;
        }
        if (params.b !== undefined) {
            this.b = params.b;
        }
        if (params.message !== undefined) {
            this.message = params.message;
        }
    }
    updateStateVars(params: MyPage_Params) {
    }
    purgeVariableDependenciesOnElmtId(rmElmtId) {
        this.__a.purgeDependencyOnElmtId(rmElmtId);
        this.__b.purgeDependencyOnElmtId(rmElmtId);
        this.__message.purgeDependencyOnElmtId(rmElmtId);
    }
    aboutToBeDeleted() {
        this.__a.aboutToBeDeleted();
        this.__b.aboutToBeDeleted();
        this.__message.aboutToBeDeleted();
        SubscriberManager.Get().delete(this.id__());
        this.aboutToBeDeletedInternal();
    }
    private __a: ObservedPropertySimplePU<number>;
    get a() {
        return this.__a.get();
    }
    set a(newValue: number) {
        this.__a.set(newValue);
    }
    private __b: ObservedPropertySimplePU<number>;
    get b() {
        return this.__b.get();
    }
    set b(newValue: number) {
        this.__b.set(newValue);
    }
    private __message: ObservedPropertySimplePU<string>;
    get message() {
        return this.__message.get();
    }
    set message(newValue: string) {
        this.__message.set(newValue);
    }
    initialRender() {
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Row.create();
            Row.debugLine("entry/src/main/ets/pages/Index.ets(137:5)");
            Row.height('100%');
        }, Row);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Column.create();
            Column.debugLine("entry/src/main/ets/pages/Index.ets(138:7)");
            Column.width('100%');
        }, Column);
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Text.create(this.message);
            Text.debugLine("entry/src/main/ets/pages/Index.ets(139:9)");
            Text.fontSize(40);
            Text.fontWeight(FontWeight.Bold);
        }, Text);
        Text.pop();
        this.observeComponentCreation2((elmtId, isInitialRender) => {
            Button.createWithLabel("点我");
            Button.debugLine("entry/src/main/ets/pages/Index.ets(142:9)");
            Button.width(150);
            Button.height(45);
            Button.fontWeight(30);
            Button.onClick(() => {
                this.a++;
                this.b = (this.a) % 5;
                switch (this.b) {
                    case 1:
                        this.message = '遥遥领先';
                        break;
                    case 2:
                        this.message = '我们继续领先';
                        break;
                    case 3:
                        this.message = '领先同行超过15%';
                        break;
                    case 4:
                        this.message = '遥遥领先于同行';
                        break;
                    default:
                        this.message = '遥遥领先';
                        break;
                }
            });
        }, Button);
        Button.pop();
        Column.pop();
        Row.pop();
    }
    rerender() {
        this.updateDirtyElements();
    }
}
registerNamedRoute(() => new MainPage(undefined, {}), "", { bundleName: "com.example.myapplication", moduleName: "entry", pagePath: "pages/Index", pageFullPath: "entry/src/main/ets/pages/Index", integratedHsp: "false" });
