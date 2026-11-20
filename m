Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795174973;
	b=maTruUiF/0Y4zBjwgpwUDrBKeALGGi8dTsmrP7R/f9giGHntbiZlQfFIntXo9UUKS+5p
	 O+7WE/VmmkOP0tEy+tfMAyOZ9F1LMUSQP1mkIzvutTKNByL7R8h+GCXgzfItYNjpweoMe
	 of6r9GGfT9DGAr8UvrS8ToaBKmjKf/PvPPhdiiiJJ0OiQqOM9riTITClzEkFIszFnZdzR
	 qxOD7n9Ej94Z0YsGfSFvS2g+HEtn2T1GW9LGWw2xe81z3Dn4AGTRJ6NXP6OvdJNFlDKSc
	 /gpPnZnx4C4DetwmvWodE60L1XUZ+DFHekqeZEO2fVwyDN/kodVWdeBrHJ8PYGmgVkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795174973;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=KmUpoxm4nBJnw9ISGVSuCY/zvYp9B1scb9wTk5sG9CQ=;
	b=5jmFxS553ACTil7uP8swyRgbCXPJRYTEW1RVBje3qPDXQRk0um9sIWuDelXNJ8phDwrC
	 ThmkyJ1E0JI0VwDrLkrKe/KQmG8hq8aWBg60dqCW2CINrirgf3aK2aqu/zeQ7QTzN9qnO
	 FmvJz6IC98psQ30G2VPdOTIgfRmRci2DaLtX20FeJGFjVgwYgJram3KbxyoR4/+YxPeF2
	 U+oLL+sTTkOVDszT8W9oPmiX6m7REgo0RjdKp1RfAQn11O5J31V7jArHtZdFWE8MXYpha
	 aaEpNVFGzoO64ttBIiNdq6U2fGNHgleZY80LYdS1flChkLrT4O0c5LzpmcYpz4LLvrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b="nZ5wW/EC";
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF34A606A320
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:42:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF34A606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=nZ5wW/EC
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3ae1da332bcso424342a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 03:42:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1795174972; x=1795779772; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KmUpoxm4nBJnw9ISGVSuCY/zvYp9B1scb9wTk5sG9CQ=;
        b=nZ5wW/ECWaibl6yEk9kWoU2seTnTybbGwffyLsyRVxjw+ydPUoM71pqQ06R/8ITYw2
         uUMoLXrkmop7822Nf3s/h6kiyDB5A+kSX6o8TYa0nf31NNAnCuFhx5wJ7fCC28+Nc+0W
         HlR8gRC/EnydzotVT9DFJDKCB6npJDIbIR4FmTGJ2vUUrkKeQeyBiyTsw5qOrIpOkjL8
         2sHfKCPU6/F3+DS8O2foRr8Q94/Ph02IF+6J+HQLt0/MKY9qkuy70PPxnkHrY13yywcU
         2VEBSgDJVrlxbdzO8kkvKKsDRrvwg28YQTSiS0lUO/UAKDogMP32EgY4ku7dyVEIRuUG
         55Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795174972; x=1795779772;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KmUpoxm4nBJnw9ISGVSuCY/zvYp9B1scb9wTk5sG9CQ=;
        b=YkU/DzXWnftIXCcRkK7kwHwhlmLBacXpLO4vc1/QBL9nQ7Inxz53gJ+8MbaMrmac+z
         1an7l49BPfWuDhxPXmrCa32E3qhE9TsUMVQzyDcS0YY6W/8vcjClZhBQbkozjZT7n7MZ
         zNw5Kb4rM+n34u3PCHxtbfPVF/6T8zS4R7nqeWy0DxXD1tT722me3lIcaaiAd9K7Jein
         PfeDNe3dtOsSnMZooZBaMWmkm65vJX3I6crdk2udTnVYOUWKIFfjprhErNbc91A2cyfK
         iLqzPj7/qtWAXRpGcj8SWPel4ZaX1aD5jfBexHQwDt953rzMEVkIwGya30BMoiBF8Ite
         5gng==
X-Forwarded-Encrypted: i=1; AL+hErF3XkCZn1mjXBc66qb8asU1wfjxVHFcpLSKRWKf97pxoc9vP76OxVdEZSQDf88/SRa/++FuO1l1d1ccp6Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z9an3apvFh7u/Nf2dwpW/JBPsbECuqYybQx6rVMHgLgX/ikDuN7
	V+9oBHpafS7hSIELf7spKnlzgnH5nuvA6Ch7tIvGs84MU/mf67U/c4m0Km9S3t/gK2M=
X-Gm-Gg: AZFdTZen3ZmbvyoB19f+KnqvT0v2aLPET7svWLcgMKd01NySEMWNIXFUArP70i4+B6J
	9m6OKIKM23vGE56XSj6tHZbFx4nZi+L8HomWAqIO5BXTQaipWTBykffZ/ygFGOcHqh07aO41JDe
	HqullRo36fEM6Srk72aNIEd6iLIYnEyGdu4ZvFBxoqb6lxd2ALBJhGy9g8ZEnVVomYH4jdaBIWO
	1rxVQ4srbrGBE1WqU/UO5JgM70REOCVS56QgwBwoFBEflYY7zIX6Czu/RzowMZsN6G03q0PxNd5
	7s8bcpPa1tpl7MUMgNEyTD1sZg2D+6SezMUiNNff+qlED7Tt8RIA611Xo+P8EESDEnqN5eZZdbP
	K0shmbLVauYCvcV845do2Il7QPBA4siqfmOQvuqNG3uEg7I53Q/25jlL52epiAXv1nyCV7YTCTu
	ysa7LGef7sduaISzd6m/VIfp0Cmcnk8Yjc4UFlpgHdy8304vYPUxh+rWAU3h8Vlg7zBqD7+q/Mf
	1r+IPXqH0vxi2Jc/Lpmy5vUdU/Bukg7T92JA30kW8CLMRIPs22cbZDImr03IzeFv/4K0U/aZKkE
	T16mT8ZIa6X8u0rpWfYUHVKf82R+IYfFDdONT2ZmostJA3y60G/iQjR4tb0ldRU42t3kn5x/ivi
	bgqkS7CjjEuSE9my7yaxA56nZGW57HDW7R/Bu
X-Received: by 2002:a17:90b:3f0e:b0:3ab:1481:69e5 with SMTP id 98e67ed59e1d1-3b41c8ffb06mr2420129a91.11.1795174972276;
        Fri, 20 Nov 2026 03:42:52 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:8b25:951:ad8d:5cc1])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6cea7c38sm1226012a12.2.2026.11.20.03.42.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:42:51 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: alexanderduyck@fb.com
Cc: kuba@kernel.org,
	netdev@vger.kernel.org,
	kernel-team@meta.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	daskald@meta.com,
	mohsin.bashr@gmail.com,
	bobbyeshleman@meta.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] eth: fbnic: validate the Rx completion buffer index
Date: Fri, 20 Nov 2026 20:42:45 +0900
Message-ID: <20261120114245.3072211-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261009175358.1598001-1-yhlee@isslab.korea.ac.kr>
References: <20261009175358.1598001-1-yhlee@isslab.korea.ac.kr>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is superseded by v3:
  https://lore.kernel.org/all/cover.1791775409.git.yhlee@isslab.korea.ac.kr/

Best regards,
Yehyeong Lee
