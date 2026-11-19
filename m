Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.127.230.112
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795058837;
	b=TyWBV+ZX7qttZdW8UvaCSHTJG0e/O589fukOCq0YZaLEQW0KTdRgA+wtlOC6xrhuMT1T
	 b3a2OuNKzr5hwEQKvhsCL869fnMOPcjCMZX1pL2a+57JblkEqHMKbuZGvEu32QD5TIibR
	 vIryQNzdOd8VH/5b9+MOCHWVWoLLZydNgJx/AQHax9+z2lQ8y72/Ul5bTUQypB6U2at6F
	 6mt+5qOQgsbxd4QaW+AtMSBSOE748+UgA36yiM5ZoYujBsWFzjBMrKGs4EJMsvVuABXW2
	 CoPTrVc3qwOwMQJowFuoSan6E15NWwFvrUqGx2ien6/7kEXt5rDcC9scf+DLvk+aWKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795058837;
	h=DMARC-Filter:DKIM-Signature:In-Reply-To:Date:X-Lms-Return-Path:
	 X-Original-From:Subject:User-Agent:Content-Type:
	 Content-Transfer-Encoding:To:Cc:From:Message-Id:Mime-Version:
	 References;
	bh=86v23/ZwHeuwYjgTIPISAtm9B3GSH5/zd26VuNwl3R0=;
	b=CYtkPWSdQ5Xoo1nNq/AR5a7ApM9Fk5ug1qx+PfudJ1qvSbW/WRKBgMjtWMPNGbz1WDQd
	 NqeluVVoeY+5D/2+5yicchtkTAOAXzvIITNW2PGbNAynt8mL6QpgssEVbFnzHMHkP6Ldf
	 epc50tChuQr9mAk8DjlrEQ56HwMxFQH4ZWYP2JOvmronELI2KqxwRYNaDC+z9M6tMPRtx
	 k6joDrHuV4b9msWkmhZsRnyATlVV7V0D3H5jhneq7UrpeVj8mkuYAmY0c80mVpxq+ub1r
	 zc4A5z3tjFIMFnfcA8hTy4Wj5vOx5vGQ1c95fJ4zXkMjBDQa+VRIP5zRT31ZmOiGoLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=XkbOPl6Y;
	arc=none smtp.remote-ip=209.127.230.112
Received: from va-1-112.ptr.blmpb.com (va-1-112.ptr.blmpb.com [209.127.230.112])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EA8560A2602
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 03:27:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5EA8560A2602
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=2212171451 header.b=XkbOPl6Y
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=2212171451; d=bytedance.com; t=1795058830; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=86v23/ZwHeuwYjgTIPISAtm9B3GSH5/zd26VuNwl3R0=;
 b=XkbOPl6Y6VpBHEqk0tRl0hdjZ8buEoIJVsEXsJXOgfTVXs9/2EhHztaJMh325uAqZAUXEQ
 kghdFaG2awt0eSRrrpN9QecUPj4T3UPyV0oOsXvcsAMSacQuKvORGO81J1LGq00U0t5kc0
 JDGZIW0QeakO/k44mX/FKSVSy6QEDfVprljqezce7u4Ulfzn6PdCk9pNZ/e+CMScOSxtwr
 EFvH0p0mHg5zotjlJS0hWFODib5i/aEqEYrZQ+RfyUDM/WKi4bwscfNVMJE82TrDPFOgnf
 bAG2ce0Es/K8NO/yEata2LXId7w7QbN7OG3vy7CgvvL3TiwkMhmkCVTPC/ldAA==
In-Reply-To: <x2m3ypyugjn25myfovxs42jgctnctmz6iof77juya3464o3bbl@qlsx2mk4smhr>
Date: Thu, 19 Nov 2026 11:26:48 +0800
X-Lms-Return-Path: <lba+26afe6c8c+aa9d64+vger.kernel.org+zhaogongyi@bytedance.com>
X-Original-From: Zhao Gongyi <zhaogongyi@bytedance.com>
Subject: Re: [PATCH] ext4: use a stable source for the kmmpd thread name
User-Agent: Mozilla Thunderbird
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
To: "Jan Kara" <jack@suse.cz>
Cc: <tytso@mit.edu>, <linux-ext4@vger.kernel.org>, 
	<linux-kernel@vger.kernel.org>, <adilger.kernel@dilger.ca>, 
	<libaokun@linux.alibaba.com>, <ojaswin@linux.ibm.com>, 
	<ritesh.list@gmail.com>, <yi.zhang@huawei.com>
From: "Zhao Gongyi" <zhaogongyi@bytedance.com>
Message-Id: <da2b0a43-f916-485d-81b0-d97ab7245ca8@bytedance.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261114172523.5888-1-zhaogongyi@bytedance.com> <qz2gh5bbbyqjqfqclatkq34pgxnvbu3ey5kf3octnlykstzhx2@s65dxum2wdso> <da634961-1d13-4d21-b181-f366fd72e0d1@bytedance.com> <x2m3ypyugjn25myfovxs42jgctnctmz6iof77juya3464o3bbl@qlsx2mk4smhr>

Hi Jan,

On 11/18/26 7:15 PM, Jan Kara wrote:
> 
> Yes, sorry, but this isn't really something we care about. It is in
> principle very similar as corrupting memory through /dev/mem and the
> filesystem can crash in many different ways. When you are fuzzing, you
> should disable BLK_DEV_WRITE_MOUNTED config which will also disallow
> corruption like this.	

Thanks for the clarification. The write I traced went through the
mounted loop block device and modified the MMP buffer while ext4 was
using it.

I'll drop this patch and use CONFIG_BLK_DEV_WRITE_MOUNTED=n for future
filesystem fuzzing runs.


Gongyi
