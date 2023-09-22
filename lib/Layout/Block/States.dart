abstract class NewsState {}

class NewsInitState extends NewsState{}

class NewsChangeBottomNavIndexState extends NewsState{}

class NewsChangeModeState extends NewsState{}

class NewsGetBusinessLoadingState extends NewsState{}
class NewsGetBusinessSuccessState extends NewsState{}
class NewsGetBusinessErrorState extends NewsState{}