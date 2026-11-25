Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795622150;
	b=knhm6GLnIkP6PqGZM8/KIgSk0P9m94Q/NN4/EFqaYtOC4tnpmTksLS5UtlohfvY+S5TN
	 2swzs3+tnVtD67XoL1VUsi+8qqgSpgELc56D/YD/xzPKBqK3vrlMcLNvAQL6Qm4aQUzX5
	 kpQEd9FhscQbJUCNhcrT2i5fncmykawiuemyCKqunF78DF6d4MR+emojsVAmRI8JGlZCE
	 S0MAn4lb/F5GUZMQMpHVETdOeG+NbS2WnTD6P6JInq5g6HmXlX/uvg9B3IuwsdPHMyWqs
	 R748acUwykm41/yfjdNvnQiHIuVd4jBOAEvcuCiPwroha+at/AwcRI3SzgA/lleAp9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795622150;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=d0IJBE3gLgmZDyJs/q0TKA06nBLgZig86REzxJyoBaM=;
	b=KarTxtBW0jdSTQev6qnSECwpx+3uEvbMtKaMSBMcX3W/wawIB9a7y5VllvLsW89lXLwZ
	 O2JXnL5KPFczajOGNNKvaNLk9xcN5Vr9cUgqGO+xXtx/NH/2EjbsCRntexVZkyHF3KrfN
	 qjpXra9z33jXYGolZ7A5oNFudPpcK8CM5HlTvjtnYGQNdoRzUsW0Q9M2sXYyK2/A7aCnu
	 CwKGsXOSNuqnM4IYfaqKCbGrRQyKnAQwW/+Hw1Wl3XJOpFh2s3xiHNVCfCKT3GfSImWK2
	 yLOh00udGzW5LVHuuxRemEeGKRAegoyN26l3bF6Vkm8QkO+WtxbvajfJHOVSzzYcoZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mRmswUYD;
	arc=none smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02CA6606A32D
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 15:55:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02CA6606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mRmswUYD
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2f05b465cd1so31854725ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 07:55:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795622149; x=1796226949; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:message-id
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=d0IJBE3gLgmZDyJs/q0TKA06nBLgZig86REzxJyoBaM=;
        b=mRmswUYDOkXq/UziIC13mqJB/DpdkOjrfmfYfcE2DAU2RI9p2xatCmdzYVlzCxFXja
         3JYbqhecdSF+xjfKruqW8sYO8X/ibagikGy4g95fhyVGBsAndAhQHpAye1kEtv7eO1pK
         KyGHIWFAtOhC77EyuTjrj4u8v6VXPq5mn90QGikJJcO6qf/zklMKfWp0f0lVd0OeDEAk
         ufQ/Qr0IylwHABzvmm5Ara8OVrGE/hi5lhGMPbvxrH1NdMb1i1gA/dKS+oMK5M/+AOam
         GHB2Z8PqHLIaKJ2sO6IyDtwwxy1Uj/8Ay+DZ6JEY5KAmxsyL8fgSD8efROoSNpinZm4D
         +DSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795622149; x=1796226949;
        h=mime-version:content-transfer-encoding:content-type:message-id
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d0IJBE3gLgmZDyJs/q0TKA06nBLgZig86REzxJyoBaM=;
        b=kwQAvzi19dcJo/ym2RgbrkDQy1xwBUXpu3gKYtitZbGZrTOOeU7tO9npyY4o44ujp7
         VZYxtcjVCWSiYf9h5FxRd15PHGAR58GiCnmIVInmjucguOF0EICR3KYwFJtqhugH/s1C
         DYcWzRMJr3jy2Dfzjl82E60MAvCKjs9ASr4gJRg6ngFgzJkTNaxfREO7+lIFcvVt+n1Y
         Nhsd+J6AwtXDqcB0eKQmNI7kHmI0JPu0bLi1gSzXliNiStXiOCKdP8KsyR4Pn58lUN7y
         hAQ7CnrlNvq9hrfYeAGNtrGkU72XBuBBtrdHx0OZ3VBAexEIywnH+sS6XzhwONfnMXix
         xBww==
X-Forwarded-Encrypted: i=1; AL+hErF+toBUgBq+DRgiuok2iMuu+PMqse+BlDYPMY+nzUgHcrVH+T7c2iwtlwxyCyQFgVjJOlsBxLa6iDiRWrA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/q3wEW7Bi4oDL38lOwxMB+MSiBX5mfwoKRmgKtFY9ykk2jrFwG
	p8/KzYCKx4X5ZMMnqrXqkoYrrfHjfu5G+UuRw62eb5W3dPuIAn2D4bxZ
X-Gm-Gg: AZFdTZca6/cB+HM7kH/0nr++adog8fOaIJugIJLNceAeCikZ4MhM0hiDSnXMvhK8cXQ
	UbUQbQ1DY4hDq9dJBmwkZfMzgI4HrZI6SAhKJRiIyUVNyWYDppAfUbs188zGsOtGJtLGvDXeaky
	ActZzlQ+EO8pHA6zLG3OZ39GETcuo4u7rdjmlbgVh4nzf1DN0IQsXeTToOsypkGSUgBjR0vYPAB
	a7IRlD8nUdf5UH0cynEUBz3F48F95YSAza4njqQShimYF6xXNT4PvnkaA8yJjtiUP4DwXaA2dx5
	ayla2A2YhM+B4FGowaQBRvE1Y47HAimFf0I+8PprK7vZvplSjxKryaKeXRykBGkeeiiKORWN/qB
	srxU46bbypWtBApfeLDSs/h+N+3TFj7w7vPObi+z1R/yFYUO7wZ/ua/ZS2b6qISCSccEw+WEQLP
	aguXiE6CnK2z7GoLHUXkw5W2sjLHhKonT8OuSZu/hRc5d6IdB162Phn28FSf6zZh5O3nibzaFGQ
	wssk6Oqz1U5LXqcjlucDFKHrBGY8/JTOSo7vvpEtVWPw0NlbYxoAePMa73a71c33//ERrg=
X-Received: by 2002:a17:903:b4b:b0:2ef:da34:7575 with SMTP id d9443c01a7336-2f03f1b6c4dmr174930345ad.69.1795622149288;
        Wed, 25 Nov 2026 07:55:49 -0800 (PST)
Received: from [172.21.0.2] (vldb.skku.ac.kr. [115.145.173.180])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f146b84sm87875575ad.71.2026.11.25.07.55.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 07:55:48 -0800 (PST)
Date: Wed, 25 Nov 2026 07:55:48 -0800 (PST)
From: Kyuwon Cho <kyuwoncho18@gmail.com>
To: Tung Quang Nguyen <tung.quang.nguyen@est.tech>
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 netdev@vger.kernel.org, tipc-discussion@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, Jon Maloy <jmaloy@redhat.com>
Subject: Re: [PATCH net] tipc: drop discovery messages shorter than the fields
 they carry
In-Reply-To: =?utf-8?q?=3CAM7P189MB1137AEF136434E219D4075C3C6432=40AM7P189MB?=
 =?utf-8?q?1137=2EEURP189=2EPROD=2EOUTLOOK=2ECOM=3E?=
References: <179550610427.774194.2378040347436778640@gmail.com> =?utf-8?q??=
 =?utf-8?q?=3CAM7P189MB1137AEF136434E219D4075C3C6432=40AM7P189MB1137=2EEURP1?=
 =?utf-8?q?89=2EPROD=2EOUTLOOK=2ECOM=3E?=
Message-ID: <179562208894.3410737.11139865919662209546@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi Tung,

On Wed, Nov 25, 2026 at 09:44:59AM +0000, Tung Quang Nguyen wrote:
> Discovery message's  header size (MAX_H_SIZE == 60) is stated in tipc_disc_init_msg() and it is a protocol message.
> How can the peer send a discovery message with a 24-byte header ?

A TIPC node cannot. Anyone who can reach the bearer can, though: the
message in our test is built by hand and sent as a plain UDP datagram
to the bearer's port, with no TIPC node involved.

> As sashiko pointed out, the lecacy node (before commit 948fa2d115c5 ("tipc: increase size of tipc discovery
> messages") sends 40-byte header. The above check will drop that discovery message. This breaks our compatibility rule.

Since forged discovery messages are outside TIPC's model, I'll drop
this patch.

Thanks,
Kyuwon
