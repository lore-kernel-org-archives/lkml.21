Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.230.113
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795577007;
	b=VhFMQvIdQ2INW0YU2FK4fuqLiw1xEOaU8SBfi/NrYvPcG64EHhkYmrU6H+8enD2Kowuf
	 r0ou772705iFOcEnDrlR/If47i6nxEViTnooIda8th1i1Xrdqp9mKtnJw5uLHqGvBBbmL
	 TJF7DUlLbNF0HBBLW5KWe8o7YSnGAtZ2WNnOQeH9vHYJtQUhkS7T9xHaLojWTKVseH1of
	 Y9RM8cd9Y1f/q77PyCx8mG9yNzwUxiytWOlX+iEIsag8x0EbrWy4alAxxFdzTK/z/G9Ya
	 yN53F6/a3+awK6DrpVd90N3JUUbOpGUUO5UhuDXZfBl59ghEjJ1gkmznuLnxn2qLtEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795577007;
	h=DMARC-Filter:DKIM-Signature:To:From:X-Original-From:Content-Type:
	 Subject:Message-Id:Mime-Version:X-Lms-Return-Path:References:
	 User-Agent:Cc:Date:Content-Transfer-Encoding:In-Reply-To;
	bh=UhKX5iRHLE1EpFI3u5XauAea94t1kTPpqd/J/m3vK/k=;
	b=NgLaxD+J9cteNU9ANLKjppSLaXudvaA8jEy5jCdossu7/klz4+PAn9HMXe9mlXJnPDim
	 MXYl8w6vb/IhUYEPGbSWuAhKX/XQeGJRiXQ7fR28SxlCa/rC7is9gHWLv+P8TB+xa76IX
	 rWIfMZWhzJn+SHC5aidyY2UmFAOlV0BfxoImWfYfgl3zk2YHbXBi8Ofz7bkww3nycbNXu
	 cg775p0sJvqijTj9B7GnqX70/VGsupv8M99KQ1ZHedHU1GJRtj2LZIJbi0xXm+DUKO1Cw
	 2cN9hqySKE0YpTfV8SOT6szxeSxYw+HLEKr51g4EGozRoUEHdDIrLpMrnsoQU8Y+IJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=bhLTj3Ol;
	arc=none smtp.remote-ip=209.127.230.113
Received: from va-1-113.ptr.blmpb.com (va-1-113.ptr.blmpb.com [209.127.230.113])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10951606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 03:23:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10951606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=bhLTj3Ol
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1795577001; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=UhKX5iRHLE1EpFI3u5XauAea94t1kTPpqd/J/m3vK/k=;
 b=bhLTj3OlWhz+EN6PIYOv1ZPDKKlj+6TOCrB9nlHOrCosJB7tJrCEN/RPqRv/EtxKofZr0P
 7vinbblLHVDyBjREp7JsMnSAly8JQjNuKI8THt4Kj4qTlpWo6s1LIiUJR7VqfA0ZZCo+uL
 nm+MhY5oBqHDsmJo3dELFRfAATA3yEpOVO42STz0HELpe38VUeazP6xb5LEdYU6lYErQyN
 YWaqEGIvb9cWNgIh41WO85CVIC8JzWofbKSs9XaVBB+p3UAyzPCbqzHPWJ00r3bLqN2YCt
 Ljww4esnsmWOoRE8wHGRFC1gg9n6lAnUzK3qoU4c8EOZu3d31VfyriWWsHx2aA==
To: "Theodore Tso" <tytso@mit.edu>
From: "Zhao Gongyi" <zhaogongyi@bytedance.com>
X-Original-From: Zhao Gongyi <zhaogongyi@bytedance.com>
Content-Type: text/plain; charset=UTF-8
Subject: Re: [PATCH v4 0/2] ext4: reject impossible group free cluster counts
Message-Id: <21a6f9f8-bfac-4a30-8088-9984247035cb@bytedance.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Lms-Return-Path: <lba+26b0654a5+709257+vger.kernel.org+zhaogongyi@bytedance.com>
References: <20261124033900.76700-1-zhaogongyi@bytedance.com> <awWhtXvIgTk1QzuY@mit.edu>
User-Agent: Mozilla Thunderbird
Cc: <linux-ext4@vger.kernel.org>, <linux-kernel@vger.kernel.org>, 
	<adilger.kernel@dilger.ca>, <libaokun@linux.alibaba.com>, <jack@suse.cz>, 
	<ojaswin@linux.ibm.com>, <ritesh.list@gmail.com>, <yi.zhang@huawei.com>
Date: Wed, 25 Nov 2026 11:23:02 +0800
Content-Transfer-Encoding: 7bit
In-Reply-To: <awWhtXvIgTk1QzuY@mit.edu>

Hi Ted,

On 11/24/26 10:55 PM, Theodore Tso wrote:
> On Tue, Nov 24, 2026 at 11:38:58AM -0500, Zhao Gongyi wrote:
> Note: in the future, could you send your patches so that each of the
> patches are sent as a reply to the cover letter, so becomes easy to
> find all of the patches associated with the patch series?  This makes
> life much easier for patch reviews, and it also allows me to use the
> "b4" command to gether up and apply all of the patches once the patch
> review is complete.
> 

Thanks for pointing this out. I'll use --thread --no-chain-reply-to for 
the next revision so both patches are replies to the cover letter.

Thanks,
Gongyi
