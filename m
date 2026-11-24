Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795486986;
	b=N8pSiEm6qgjjXKjf6maqNwC2SsRDDJFJxjGnYs8QthfRIBPa0QwHJwpIxEav2PlCDdZN
	 VPdoi1tdE+QdIJTPftrzTFkA3BLXOmeIldJehNugQzG5wlHFWO3MhaGqtjlNyOZ5yn2Pm
	 9HAsUuBCvdtIELqoLZy76Pll578E18hYUBekRsYcMzBVm18Iwf84gQY82+fQoyTmBhSDo
	 8LzvMxI+vTac6ZfIj2QsVabyRudiPBpMVitGwdT0ErGq8JIP6g3PFB8DW1sVgh1PZmurJ
	 nRxumQKKS3cbVVjjSgyjCwRkr9fakDM4f0QWecCe3Wu290Dfbw0Pdw3JdIgplRzjBPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795486986;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=WvgO7pqnsYsS4en6wj3vVV2RD6XhcMibM3J3Ihuie2c=;
	b=e1Vzl+WmcBIQP3rMC9Ao0CB3tWJ7HX9adGD5+cG8g2PhmQRwButMJsAiNiXhkYRARL+g
	 3zGil3hz87VhsbGnOs+UfZhLKBF6vYObutLRluVd8ES/8zM/qcGlcAGBXUz507t8DR82M
	 ML8HPCZPbso5QqmcgQaM7x8eZCHpS4mi5gq5wXL4E0gvWdKEzoUps2qvJ8jNgu8UjFoK4
	 CxcaURG068vvIPGPTZ9Lvm5fws9btA/F1lf1MKrWZKzuLEYE/hvqwAKfAZllTcMGy1Dun
	 ZnzM74vA0xAWt9CfpUwtE6wGF6xoex8KOBsNOz6yZNyBJ9c3Tlm3XOpz378fLpupp+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dEImYII+;
	arc=none smtp.remote-ip=209.85.210.182
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 019A1606A321
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 02:23:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 019A1606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dEImYII+
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8b6a88e4341so1699332b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 18:23:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795486985; x=1796091785; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WvgO7pqnsYsS4en6wj3vVV2RD6XhcMibM3J3Ihuie2c=;
        b=dEImYII+AfBPykE1rln6dfkL/AoigkBcD+0xCIDiMpHb0H8cNcjZkygfwDhgtjDfcJ
         9Fo/Od1n/r+bfOkmHI5VnGla2dpbCoMf21vdRipAzEwyw4z+bW6s2y1rpBcihJEm0H5I
         yL+cO/0mhUu1Zk5yczDwP1D0zZX0QVhOrUejPEVarYUtJorOiYsLISNW8bUdqVLiZJky
         4Q0fsvMtpnx8J+ZF0M1CrwQDO6ODKggsQ1LSFfZiKSjfgOxpXv5FBjUlsjrbVMlLMnax
         VJDTfHgIfvNp/d9GMakzf5ixPqr3Ym4Th/X+gzTtKbMYJhmCRSh0apOqXXrBefiGAVxq
         D5bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795486985; x=1796091785;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WvgO7pqnsYsS4en6wj3vVV2RD6XhcMibM3J3Ihuie2c=;
        b=SCIy0ZYtPImfmyr6FfWL00oZE6QXgEPMaOZJagU0CideaUymd7nX57AN7H6fyM2isQ
         KELv52hJRNfqWxiEofDuxJ/tY32g3Uj28I3yQ3ZACaGf9HTu84Tv724vfbhyDRmNVaQb
         2+G2TWGCwhFIhL0xXHXJvMkX0xl7xzqvghGKuinsjk4PB3exEPzMed67tpGIEd/WpBr+
         T6zrB/+71nA0XwREONbtgxPJauYpBUVJ1b3DVGqR/U0WpdUEYnSEL2Bmwozt+gEimBFH
         sEH8euAmbkHE+xST1B8bSWgUT94fJcjac0saa8Y6evBcc3eRdeUya1+1b6t//E7a0f4+
         fgYQ==
X-Forwarded-Encrypted: i=1; AL+hErHXVWxsFOKP78iOFg2Hkog4C0B0HjsGeIuxkdbZcoO6894XaZbtEJ3HfDQ8kWB8XExXChTcBEQEh4apPV0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9rpyLlCtBDTP546CSbUYarSaRGU9NKBDOghYJMiN2s2EnDMG+/
	6uBm5++6zOV1nnvlKne8EBxdb+lYSUiW207fhbIpc1CsMl093ls6BG8f
X-Gm-Gg: AZFdTZcb/TeP+NwUSVgSebVUCnMq2bDrAmgtINL8PvTRsG2YB++cQtlyq8I0mQ96Buq
	ALgau8PHpkki0PuGure9IEUpIIqeAMMv+uteM/mLFonnQlY4ytKmetxYx+8asNFfLm5Hpvzk1dJ
	LovK9S0+QWi1BJP/5OyLZNDzdvt2Wk26k9x1UZUX/642TU/QkNLKSogWirQvhKjHaqcmfQgiwGa
	qARGyK85OnHrSCKx1tNmngpQsDhs0L2Pap4CA09jgTNToKEsB86RLefu84Qgw3jLEWKkKyF5Osn
	BTZeSvmbIbyWxjEcf6GuuEhrbMSEn6fnCViyk5TTXl884KHI6X/EWufs5rC/ritmbjqXtbFcgSp
	mMvfPVCmL3P61QAl8R/uEhUlcppSrVDycprU2FGQkfl1wYcKc0Jktetecg7J6XPRHDZBubfk+WY
	Y0g4zwqYkv3sB0CCCXRmgCtXToF8DzBmDN+ubRGPPh9G3SAb3CwtU8dGpbjEDvWlwzEgb5wpFb4
	fmTsZeco9Hw4yoBi8tpl6J+RSgy7OdGYQ1iGJGDWQQthU4imC3vyjLutrUWx9qd6fJx42OW1dfr
	b6LSPj5uExK5lVxGXUpCzT4eoZNR7lFMrBkpyv5+rXkeLM52HUM+qza1XdVsLTH9hwgnsgFZ81R
	USbj9SKp6g+nQIniQSApVsBxE
X-Received: by 2002:a05:6a20:ef19:b0:3f8:500c:1de5 with SMTP id adf61e73a8af0-4014ed55fd8mr12187901637.66.1795486985241;
        Mon, 23 Nov 2026 18:23:05 -0800 (PST)
Received: from [127.0.1.1] ([74.176.208.23])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87077944bsm6439892b3a.2.2026.11.23.18.23.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 18:23:04 -0800 (PST)
From: Yaohan Li <shunsheng1218@gmail.com>
To: Mika Westerberg <westeri@kernel.org>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
 Andreas Noever <andreas.noever@gmail.com>,
 Yehezkel Bernat <YehezkelShB@gmail.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject:
 Re: [RFC PATCH] thunderbolt: cancel pending DP bandwidth requests on teardown
Date: Tue, 24 Nov 2026 10:23:00 +0800
Message-ID: <179548698032.1835311.976395071942954809@gmail.com>
In-Reply-To: <20261123054525.GM229695@black.igk.intel.com>
References: <20261119023558.1495581-1-shunsheng1218@gmail.com>
 <20261123054525.GM229695@black.igk.intel.com>
Content-Type: text/plain; charset="utf-8"
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

Hi Mika,

Thanks for the feedback.

I don't have access to Thunderbolt or USB4 hardware at the moment, so I
cannot provide the hardware reproduction or the regression testing you
asked for.  I will put both RFCs on hold until I have that evidence.

I also take your points about keeping the fixes small and writing the
changelogs myself.

Thanks,
Yaohan
