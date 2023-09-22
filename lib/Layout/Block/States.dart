abstract class NewsState {}

class NewsInitState extends NewsState{}

class NewsChangeBottomNavIndexState extends NewsState{}

class NewsChangeModeState extends NewsState{}

class NewsGetBusinessLoadingState extends NewsState{}
class NewsGetBusinessSuccessState extends NewsState{}
class NewsGetBusinessErrorState extends NewsState{}

class NewsGetSportsLoadingState extends NewsState{}
class NewsGetSportsSuccessState extends NewsState{}
class NewsGetSportsErrorState extends NewsState{}