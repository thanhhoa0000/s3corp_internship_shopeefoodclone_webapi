﻿namespace ShopeeFoodClone.WebApi.Stores.Application.Requests;

public sealed record CreateCollectionRequest(CollectionDto? Collection, List<Guid> StoreIds);
