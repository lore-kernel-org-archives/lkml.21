Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794975119;
	b=t0a5sVnivzyXTO0wMPNV69P5983nymFXNSMKVAI3Gowb/NVSFA5As6xnEgg0n+x2ND1y
	 tzzpjQw0qRk8WR5UdLdhwDKtoiMI2cH1wvADWLOotpMf5pRwGHL61PR1ftIPWmJzvwuD4
	 OlCbcDRnQSYMyldIhCqjcA1v+Dfk1Xi9eNXQPzcAMP5tmz3K7d+4cCc760hgfxdg+A8O8
	 XrZFso40Xfy26no4yzFGsDcvoqPwB04KJxV2WJ+jE8nwUeH18ZAeLNR9BKgsbNeGXPb+W
	 7jqGVSa6d2D0m/t/Gq24hPb5NHE/2Gml5RYgfiRTgdjcXhRGBMaWvGDOFH6aGcVpavg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794975119;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References;
	bh=Gy1z0HGLQPQ7kJNGutS6TeEdiJI3oQdVi14nSbbISdM=;
	b=So+M0CsFaGmzEUWSst9g2riOZHiDUEJ4mq1nZoOglPaqMm6lmSnnGFnqDUA1FVBImDq/
	 9UaCchmoMnCd/7s9RLj4tfssmcRMZcDwVk014tjhsXTGT6KMwMSGS6hM3QDDhPjkcS+34
	 mC/jEJL0mx0OjJ/l8BZucJFpGisMsXBlD8YZ8Tpnvo7nc1d0+sYtPfxNimbMFVcOD9wX6
	 7TcvD0BboW2TJFAur2fyW8XwiivrwtxaXKqJhPudrekHccQh5r0BnL1vg+HeYTznaBOfK
	 8mfed/R4pbM/kboELTNEtQic6XNZLf8/pxWXiBfR44PmN9vYLl/DkmgFxdpFRBSxrlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="JIt/SX6r";
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F54D606A31C
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 04:11:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F54D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JIt/SX6r
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-3282db206d3so1566009eec.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 20:11:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794975118; x=1795579918; darn=vger.kernel.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Gy1z0HGLQPQ7kJNGutS6TeEdiJI3oQdVi14nSbbISdM=;
        b=JIt/SX6rbjGDYOcrpWEYEGQLb4B9SW4RAycVjyYElXIb5sejFFMvLCFnm1re0yxaeJ
         iwO4yCnDLBm5hrOpX08r0RrMsRnG0lDhbQiCtj7KM4MB1JuCCXZe8lWdjy7dqVM51uc5
         qZGbceBUH1lNlznRmAm8Em8LoYzFwy3aGddceMM7MrlXqf+KMYQessnwhU0NsilU/KA3
         35tnvsnjTJB4ridtwBD+lriYNFRhvl98flkagc+UNELhBHLQQjIy6ANCjtzRcuKtQ7Wo
         axz82YE/E/3CHXdqWt9MQp4F+lOwCbi3pMd3NFTqOLlmCX4sXk/jkaz3VVloOYjaXi5m
         zkMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794975118; x=1795579918;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gy1z0HGLQPQ7kJNGutS6TeEdiJI3oQdVi14nSbbISdM=;
        b=ktkGw2S7cQfssY8ow+ssFtMYJ8LUj0u468CcapYnotb7lvv6RLrJcyAWKbtpHfpRw2
         lT9siv9QBeCpCJRNkM1d02/JY0J2RzD6I4pGmmGiwiP+qNYS7+vyJA5IK7kiHYXVXkSO
         vFwmT8zo/6fzppDG9s52mkf26lFJwHqpNLfrr5bDhtqbbF7gI1N/S0eqs7NoyhOzGi5P
         Fz3+z7l4oTO4pmktCAzMAWcycluF4XU+sAxvL4kECaWKSgcjbFk1RAUGkGS7mxzqWo2O
         tsdPLZJjvmcxmOoPBLh7mKOAJuwzC5r2HZmEfuKWL/+uaPL6/RiDEDuEe/8K/EgYOCYZ
         Ie2Q==
X-Forwarded-Encrypted: i=1; AL+hErGt48FZaBvFeOM9GDHCsnE2+2CVqqNBa/eV32o5tuwYe812RWu1/nWKOJfcBPdAwngdQ9HAlC1+bWYyWNk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8UiPZz30RWUbYunf8XOoxLK7v/h8Boqt/6M6X1TowNJ5P8xgBJ
	wcdfV/eL4KMoEwWxFzy/AgT1HZ/Xu0IUCBcwqk2w//O9F96U/u5NtNkDw0r75g==
X-Gm-Gg: AZFdTZfBA6OMWNwi507Zs4CcZce4ZHR4OSbvEEfHttUSAPcWzBsj8UDysLHgH+dvpK/
	rSa6eNNAXXuDgIjbUaILBkChScdkk8Z9EMORxQJ8El90+ZR783bVz7CtyucOP32xzc9vF+AJ96H
	xNxxTfyXDbYfK6SeornkMRi20ugWRI1zJ+L9IT01OBLPU3krrfmIlGYBns/eyJI3eQ8dehl1uJO
	CL3XKnwUAn+DrcvlN4vc4VJ9RfpWklJd6B/h3oO5RwPqShL61IiY3eIsax/3LmPxE/o1ya5PBP/
	RvNq4gAlZGM3yKyI13jqguC4VuIr/TGfDUverNnAKXgBklUvMH3+NJa/WxnB0T8aBXUJp0J8188
	ZyOaxexIA8kUVeNYu8QI4rq51rr608mPktfBtgnH5uIkbrWuzyn96Rj6kaUt0Dd0VPSNQ53DgP4
	IWnttZh/ocjNzUEm/v+T8GJ8MMCO1TTp7ruiEJV46jy1JezX1HwYlRRd37HbfOdaRVJZHmhWrpb
	LI8sMUQ+fAgqXypWvWJqGcAKkVxkaeiA5U3++sUg2zu1cUcxel6Q/6Nhx+APx9fRg+l8CxxKz01
	MTTZjOceW/2dsTVkyheS6c8At+8=
X-Received: by 2002:a05:7300:bc03:b0:369:fc93:eda5 with SMTP id 5a478bee46e88-38281427c34mr1917517eec.39.1794975118411;
        Tue, 17 Nov 2026 20:11:58 -0800 (PST)
Received: from pve-server ([49.205.216.49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a75d8015sm2686335eec.21.2026.11.17.20.11.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 20:11:57 -0800 (PST)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Christophe Leroy <chleroy@kernel.org>, Venkat Rao Bagalkote <venkat88@linux.ibm.com>, Shrikanth Hegde <sshegde@linux.ibm.com>, Marco Elver <elver@google.com>, linux-kernel@vger.kernel.org
Subject: Re: [RFC 00/12] powerpc/pseries,powernv: Enable clang context analysis
In-Reply-To: <cover.1790517984.git.ritesh.list@gmail.com>
Date: Wed, 18 Nov 2026 09:37:05 +0530
Message-ID: <qzgi7pg6.ritesh.list@gmail.com>
References: <cover.1790517984.git.ritesh.list@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list

"Ritesh Harjani (IBM)" <ritesh.list@gmail.com> writes:

> Enable Clang context analysis checking for PowerPC pseries & powernv platforms.
>

Gentle ping on this!
I am soon going to send out a new rebased revision for this and I am
thinking of clubbing this and the clang's context analysis enablement for
powerpc/mm series together [1].

I am hoping that we still have 2 weeks of time to get it ready for v7.5
merge window. Will appreciate any review comments on this.

[1]: https://lore.kernel.org/linuxppc-dev/cover.1790590014.git.ritesh.list@gmail.com/

-ritesh
