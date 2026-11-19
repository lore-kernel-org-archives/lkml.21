Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795081184;
	b=oxg8xuxp2rS30bq2rCqANw+1FsF+og1QBLv+jFvFTJXVt68DtQZ1/K1D5axT8aBTP7H8
	 /078LBKkxZ6PCcL4OxqvVIqBnyEQfKjKsYwJ/itr5QJhhfebtC3CUUzJ7OSibwVB9SnVt
	 5qJGtIRCrVZ85plwci/4Ahj8Nn7HEqOuoTID39ew3NYOwxZZGeUcy0sKFpC/rtgwj7SAL
	 455h2WnmtUem98vymOkVFg7ey29OkMRkRRMlEpiA5wIBScSJ6jGjKLEeu5nZ7rShDJjyp
	 3+UDUxpOCNNz12sX5rUrtLGlB0xA47M7IFuDHOTEQXqCGvRfbUz2aQgh3JxuELy+JSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795081184;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=gWuVI8HxR7JfjA1t+/23RskheqcPsWvO6jyOlH8EQmk=;
	b=u1fGWMJf0p65IiVR6NHmyi4SuiJI9h6X1yWkVxuS2Br1s+mr7XioJi1jlghBwf30mGEE
	 kp/C7h40lupbMJ06vCLMQX6B9Tow1QXXGMuj8xrOPhY+9bLtgi6JXTkzBjDE+1xVwF1HP
	 2qkDLnyZNP/BG2DlZ7TVhfiy3SbgG2/TilSQ98OSOWaM1pgHItvW/IRY39ED/4ljKeYyI
	 bryGLfKr7dlg2UuMqzS7tAcLHhRBF/Ju6hFvsROtpe4yAc+E1XYj1SAGO7UYeYSodkpn6
	 p/FqRs8gM9+9GYyaleTwM9svoGvkGDZqb0ueZvLyH3jXLJe3xP52Abn/PThOMNNsvVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nP8f6Yst;
	arc=none smtp.remote-ip=209.85.215.171
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03307606A320
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 09:39:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 03307606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nP8f6Yst
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cd61cef87f1so1316984a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 01:39:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795081183; x=1795685983; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gWuVI8HxR7JfjA1t+/23RskheqcPsWvO6jyOlH8EQmk=;
        b=nP8f6YstdY+v6keVOSeX0NYlIs2meQzc8ka1Oy76sT4ha6PhC3Pb/XwHt51LTF+yiU
         tjg4MERP8uFgMo0JLwWy/tWDeUNBkDs5oVgStObyncGVSJKwusf6FBG7DGDLnmbMdENL
         CuWB++9EItEgZ+0XwLUvU27ysmufyHordHqi99lXoPdM831pxBXxh3eSVdmEkgxjLigp
         x+/3poB2fc3WHnkOavUd1ebZlPKFvDDR3syUXeiKRP+IOp/kXYMgYSHVCAOrMhcfkBeX
         GwU3Bf8rP2aWQBCbtaUa+YccPTBVjwHslroku/49oH0lLRyMcAkvF9bOQXGKRNVYzto2
         V+zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795081183; x=1795685983;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gWuVI8HxR7JfjA1t+/23RskheqcPsWvO6jyOlH8EQmk=;
        b=leBK1dcLNbqs5ChHtWnKAgUHUCJkl+o0zpKimL3/twhdsM6zAcDpW3QxtYAcG4ZfMW
         3IkUMkd4yfnAjFTJ4jT1iD/gHtzslvQ60YvWuERUx6g6v0pUskk0hJI2ZstA1A90zxkK
         q+KSAQvvGn17D+2ZePNXOMxfRWpi5dvoMOIyCfNkVupx8QFORmtwIZHNGmeiKcXNFKyf
         2Wrer4ZOSKtfBTOwzR1+Ms0eQbUfRfRmPQBoW+wa8FUu4LK7UeuZmht/ozCUeQYl6e+P
         XU0WAYsdDtE126gpgILC++nsHtgSpx0o1qAYR3ClFPoy+cQeBnXrbkUWkCIOarIkQE6D
         +h5g==
X-Forwarded-Encrypted: i=1; AL+hErHTnklN+kIrds1N2cYawaId7wek5PoqxTuc7XLLMNC/qEZlPxrEcmKrG//FL2XgknOASqutW8WQ3jtaLzk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+CD2Ilyw/cTDMrQcNBDTLdzel1Adt8MvLh/3LY5TT+FNBfYOBZ
	cbFrqcVpVx9W2Ccy0KZt2GoOHCpUCzzoooiaWQTZwL7CqzXcf4i8gFrg
X-Gm-Gg: AZFdTZeOiA5zlDkyh56Ou4mvgtFLdmtM/Ja6KtTrCUnDVqBkkoUvpmlQJhKcuiUW1I7
	rQrtKGR18Pw1AI3t9YBxAqZrJIUuchhBr9qAATHYVlJHViK/aD7GgsuyVg/+yCc+P2XCcFbUe/K
	XaKPSABk47NyoKlHW+0kaW4JKylxLT8ENPnygk4PKhWHxnKnjCD+VJUNQsI1u/L0xX0XPJpIB9p
	oN/jdrVSLoZdLhKChgzo2Mc2MtVGJSjASV2MZER7NavP8hdLFVLu0YuXYW49hH7J3UOw1P/+kW6
	c2IpMgzDknvQxmqxISJPKAvfr6djFwI3zc28RrU9gsHNAxkCgpDAQYRq4dkBqploRywNb4d45ap
	onOU7+RhV0c3ixcDytIueZguZ1CrfpY6EtDF1Og7fuziyfxHkcXZhNQ0oPKXc4mxOT1ZZd/6i7I
	UO16nmxASNSRS6AluWj84uxb0CFzZH7uYsOUvSS6l9K9uC19YNquyyt9s3w9eMoTLrP27wK9dXN
	P7ekKRzkhjuis62eBWsCBXY1DSXNLZAwHZEIC10K8bNV4cfml4h0xoCOOghEqZOCARee2kfvOj8
	mBda+Jg75BRjq7VFbgsnEhu/Rbo7qYBd4w==
X-Received: by 2002:a17:90b:2b4b:b0:3b0:d070:3c4b with SMTP id 98e67ed59e1d1-3b3d07b92dcmr4575955a91.33.1795081183316;
        Thu, 19 Nov 2026 01:39:43 -0800 (PST)
Received: from server225.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405d63728sm2085855a91.8.2026.11.19.01.39.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 01:39:42 -0800 (PST)
From: Ping Li <leeonion.muyu@gmail.com>
To: miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	leeonion.muyu@gmail.com
Subject: Re: [RFC PATCH 1/1] mtd: mtdchar: use kvmalloc() for large read/write buffers
Date: Thu, 19 Nov 2026 17:39:39 +0800
Message-Id: <20261119093939.1451208-1-leeonion.muyu@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261119093801.1447618-1-leeonion.muyu@gmail.com>
References: <20261119093801.1447618-1-leeonion.muyu@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: leeonion.muyu@gmail.com

Apologies for the duplicate -- that was a resend glitch on my side;
the two messages are identical, please disregard one of them.
