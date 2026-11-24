Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795527154;
	b=c9iq33rm//MmeaAGomIyrw9wvMJlcYIKNGdUrzSIKQgl5KLsJKb462s96xVJNHP2EZnc
	 QJVv2uwoKAjJOf/KTcz9hrjHBgDSafm9PsOZFaloug6Zk8psyXianlay0pKwvxUZ1ASOZ
	 HPUJ2ar7SkP+2Z/+FwrLnHeNcxqz+csO5sFiMlleJ7tR7Cqw8xKTaTtVjuRKiM3/4VfHu
	 ufYVadQ5WIk4XrecqSR3FQ6Valb54CjQpbaQQkfpncpxSWa4I9Em4HOxSeJUBL4ObJT4p
	 GUBK1y0ElFnKE1BX8IkJGiMxF6UxN1qoXru28FNg6IfxtRjKJYgXaNHywxtY2BIxrRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795527154;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=yoACHzjvOAJdvpPuferIsXvKypwVQHWVjU7r+31tcrg=;
	b=tJlLO9ejmhzq/4k+QzmKs4Vk5Gwjq54lvfJbsB1mIYpnaWT4AAB3Q3EPsJWJsSpmS2l8
	 mhwhbd3x3n6Z0SsbSMZA/u668Ojecdgsj3s6ma8D0uhwGUptdP3Y4RTv/LJONr8KO6sIX
	 3TOvVKBRI0TYB8ulkU3j8fLK9cu3cSt/kXYEZr+wS+iodR+6YrCfH7dgBfeBPypHrupQ4
	 fRQ5+N0jT4oSQoXm1S5s67xnfW/H+CVEltFQzsGkPROTEPLhG3y36bTg7IE1ukvp6qv8k
	 MFQLv3DHAhL94UWGTjLhtEQLIv4bZRRQ5vgLbdhq9iXEp9gRvr8aBKpIp2Nbuk6USeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ueMG2Buz;
	arc=none smtp.remote-ip=209.85.214.173
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C8D1606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 13:32:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C8D1606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ueMG2Buz
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2f06ff94acfso16106725ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 05:32:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795527154; x=1796131954; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:message-id
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yoACHzjvOAJdvpPuferIsXvKypwVQHWVjU7r+31tcrg=;
        b=ueMG2BuzcgorKMzxH8JBpCaCkce4MHYb65SghwgmoIdop3I24opihHNjsT4k2iRBAY
         2Jr1dFgGBH0EMuSfTEDizUl4WjpEkvL9dKhu5Bw1KGfx2S2c2ozToi041YPCqbwyJL1g
         BwRbQMrvHhZ1ItlbnnQLK5Zb5vCsPSqY+G4nWKogFt9DGxgOEhXMyqf2prnC8M1LOOI+
         8d1AB1yQEh8qjda3MgTV5k1S67CLlAzktnh94Y1zFk9GEaWj4ZJzziQl5sxfOWSJvffD
         kVoloIRmRyElZlA6Q/N9wQzax7HM2jxeXn8q1KC/p/kvS/hKJABSl+6jMaDettt006Wr
         I6+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795527154; x=1796131954;
        h=mime-version:content-transfer-encoding:content-type:message-id
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yoACHzjvOAJdvpPuferIsXvKypwVQHWVjU7r+31tcrg=;
        b=bDHmHjYeoTnYJtrvtyy0Ca84UdxyKWXSCQatoEYFlkMWl2cIrIDtT2px/xUIBCEZIV
         MWI6NCY3oX9XFBGPFEXz/aXISTMdteeLxtw4yD7uMAc3az1a3ONL/qe4T0nKc9nWDsN8
         MiibtF5jA/T2XnWSsuKrar3VIKvu7EULF91unhQbA+gcCP0MuiAsCNo/3whMl/JhxpXi
         O9ossjFUFlbe1s9vrAnyF13UgUTCCPEqcbJhzeXeP9ZLVgDcmmmJUEkpJhVPE5OpM8Qm
         O8CB9VccFHQBA5Lk/jearsBZTDoW2Z6/NOofwyFJ6U6m2re/LLA1dSGeGqsS5MapUitv
         QM5g==
X-Forwarded-Encrypted: i=1; AL+hErHKQSCe3JbP3/4CHayaGraAYyUwWJEzFEVazFiLTKLtOfWEdV+fAadxplrmRt0dM+9axketoXkzOqA2fMw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Euc9D91VL+uJWyA3Qiac26jLFMAb6bTHgxrYgA0hLQ7Bu7/NM
	fy4i3U1hxHDgrbAbN8r25nk0V/KoASQRS12EPvBl8+yFaAAitaswb/44
X-Gm-Gg: AZFdTZd0y1Tl+cszRJBdWbtTmr/nlU9HjArrD+Xx+yrEl88hGLhB7UDKIso4oNHfR6m
	4aiqcZMIy8dcOJjriWMy+MQY00DHZ8NeVcYW0wW1Icr2fvk0OyP8og69So/2IHZqPftgHobffyd
	HUvzE3XpQyPSxyFjeqeUqB9LsyYX6r2/f8S2KazOv2ROCaPzx0z0mbKyyH3HDO7WRuUVSc2DGHB
	f56bp8yHp0QDs8I2fJ+qbaathr++5TJtH7ZXA3X8cwkqfb8SweCIelEWVd07Ah7jct0UytLrGd0
	xnHkZOIXI4PNHlrSH4M8pfbQsPg2U5pWigI5GjwfNxtrES3oS/8xELTRnT9ZoU3E4zP8/bgJwsc
	lu902lTpbVMXd+nJDP6HKnrS29d1D0ibF1qcEawaI2s/abRAHf8zH+QAdgrOO6+DQzTvMG2sG4x
	I+8BaBHJUOd2jstXv32rqhvB7GD4zOhaMtiHGekC5pDGegjlxS5rOKYjx8CRp58L2Osdg0EhT8o
	5IFotpo77VnqwaaQ8e6L5/ke8tr+J5566lPmQ3iGWFxHMQY03Xyi48YNh3AM/xSh0wnWic=
X-Received: by 2002:a17:902:e80b:b0:2e9:9a19:c43 with SMTP id d9443c01a7336-2f03f118277mr143962275ad.15.1795527153946;
        Tue, 24 Nov 2026 05:32:33 -0800 (PST)
Received: from [172.21.0.2] (vldb.skku.ac.kr. [115.145.173.180])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f118c7dsm69525075ad.55.2026.11.24.05.32.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 05:32:33 -0800 (PST)
Date: Tue, 24 Nov 2026 05:32:33 -0800 (PST)
From: Kyuwon Cho <kyuwoncho18@gmail.com>
To: Ding Feng <dingf3ng@gmail.com>
Cc: Christian Brauner <brauner@kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>,
 Ian Kent <raven@themaw.net>, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH] statmount: retry an overflowed string before reporting -EOVERFLOW
In-Reply-To: <20261120033644.99834-1-dingf3ng@gmail.com>
References: <20261120033644.99834-1-dingf3ng@gmail.com>
Message-ID: <179552693473.1490262.10477620788152048784@gmail.com>
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

Hi Ding,

Moving the check one step further up, above the "seq->count == start"
return, also fixes a case where a string is dropped without any error:

	/* signal a retry */
	if (unlikely(seq_has_overflowed(seq)))
		return -EAGAIN;

	if (seq->count == start)
		return ret;

The NUL written after a string that ends one byte before the end of the
seq buffer leaves seq->count == seq->size. The next string then emits
nothing, and the early return drops it with no error and no retry. For
example, with a tmpfs mounted on a 12278-byte path, statmount() for
STATMOUNT_FS_TYPE | STATMOUNT_MNT_ROOT | STATMOUNT_MNT_POINT |
STATMOUNT_SB_SOURCE returns 0 without STATMOUNT_SB_SOURCE, with or
without your patch, and returns it with the check moved up.

Could you fold this into a v2?

We found this with an LLM-guided test generator, a research prototype
we are developing.

Thanks,
Kyuwon
