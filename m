Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795772419;
	b=ctTkOIrAZ7n5wZ6poWFTsgxMtXjwmfdgVpuZDVV3u8o5isbov0TnIOp0Ty/8uZQ6R+vD
	 uT2iG6ePY/Z2u6u0zeO7By80clbfM9FdsCE3e9/i2ektlgtvyuUdi47gRaCq24DAKSFtm
	 xCa4K6FCXtNtV6okOd0rQmlBhJV/avODzSMV1INerJu8c621IjZw5uQHGCRVEyNsZ2chC
	 ARfLn8w1uKdlWkxgB/J14/atvZEfT+Q1Lleyd10MZQysJyarH+kOd4mm6NYbsj8AXG5VA
	 ZzD+8xU944Hch5adrbv9btkJdFcPu3O+swNRR7PUqB8hkwueeAUM281I0oVLzBd8rdg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795772419;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=j/S2sE6LJNqIp5xSQpYLBNCbXBU+Ch2UhYSZo3FN//s=;
	b=lebHls3049X7XQoUXDEh9pV0K1F4+RBawvlue6O/vmBqAn3jhGFvnxclkM+RmN1vFlLZ
	 gi823FNrjabdwZ57l7UVUlXzoq4UAXle/4U/CBcwFAOq6wVy+J3jmD/paLK+rNVzhXfm2
	 ja5gRN/0tK8LqaE2aMlLocVyZmhQ/6eg65HmwxpLDt9q9dOBO3582jmwj4ZpzcoLa8kVw
	 VgjL5zJQDbfQNUOnYolFQqhILfpikagXby2AEq+522xsOa6/xoDcoNalOdwo9gisEA0vp
	 MGugtsXwq2n6sOotqj3Nb9ti5938ivcIlKicstOY8YsZM9MLiwgaSJw6scrTvYVU9Sg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mechasystems.com;
	spf=pass smtp.mailfrom=mechasystems.com;
	dkim=pass header.d=mechasystems.com header.i=@mechasystems.com header.a=rsa-sha256 header.s=google header.b=FjuyAmVz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.50
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6F6E606A329
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 09:40:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D6F6E606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mechasystems.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mechasystems.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mechasystems.com header.i=@mechasystems.com header.a=rsa-sha256 header.s=google header.b=FjuyAmVz
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1b563e32936so3758670c88.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 01:40:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795772418; cv=none;
        d=google.com; s=arc-20260327;
        b=O9LQkOSWz5zfqOI5zk9lnu+qsfU4MEpj3p+w/8uJultMZmFOV2689J+uFTIhnO4vDv
         F+cdbZb7JBs30ivDtH4xj+9fA+k3CZatFiNbg2csbccBuPyPF3t9MhI5o0RKM4DUQF+o
         usERKMf3RnSY9TcSXX6za1FLVbuUWnG1oH7M8SjrQDheu/C8JzxdAy37lrZN3V2pLJZx
         4rQ9I3wNIZz8mJIxKyFRQ4ClvE5kJf/krbyW50LDY8ATJseZ6imr7++BVwOIUvQRb+db
         rT1bqyftUwD9Sx2GEub/JkbBxbS61x714FxQQwVgVx3T8Ve9AqSP68iAbqDpFVh5iWDE
         bLbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=j/S2sE6LJNqIp5xSQpYLBNCbXBU+Ch2UhYSZo3FN//s=;
        fh=CazRKwkaCZR5uGnpznwfentbvcmbr+biVZY6JWtw28w=;
        b=PgWF7SXUV7shzcDP/p5NzCL/BgM+Ky30HRmCF+ESin+PsFmfj9vCNVsOpQ/KxEXESG
         7DaIjXNPBjj+f8/Cdm/IvNScPZ1IApNzT+B6HLpPOqqzCWwmyKJxw1aBMTwZtYWdxrU/
         tlURNw5k7c4eJnLuRbVTnPPPRpElV9HQsA96CErgIuiMexR8HDMDoHhOk7znzZTCzH8J
         5Ta6ZWjv0OYce3AfYsXSFdKznLtOt+UO1aKAjuclcH2ojOq+DrjHb72qwBwOw6HIzQYt
         ohzFV5rMGYY7apUH3MWyYz0i3GQy7LuR2cHgWrbZaEb9J6wKOPM5exXNMqRvd4FwPFV+
         gAIA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mechasystems.com; s=google; t=1795772418; x=1796377218; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j/S2sE6LJNqIp5xSQpYLBNCbXBU+Ch2UhYSZo3FN//s=;
        b=FjuyAmVzedyapcV8+J5+xQLnT8tRrqPfgvZb3sfqnCUY+bcouKkmivF+Zy27oQXxTq
         luM2ZtgCdrzLeEe3KDO1EFLoP8CLQSMg5FcH9+MGCsp5glQgudYHj3mDvQF/lH6sfUJv
         yRiaKoRaIGY9ay1g+lMc8O57cNQxVcJAq4GqQyddiMPIU3NIl+om2uGbUyJZhnYEHDhq
         H8+JQuEp0yOHIPvAbvI0M0QdapiKhtLt190gOs/zcjngMtFS2pnT+4pybcnrg6qXvmtf
         NdwdyWZQLyOJ0ZXP4oEOMEaKZK37I+7+XZlvh6VNNSdwojQmCClZBnO4nKQ2dd8eEzBq
         klsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795772418; x=1796377218;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=j/S2sE6LJNqIp5xSQpYLBNCbXBU+Ch2UhYSZo3FN//s=;
        b=nk2/StajAPD5B7n257EtUnWMy4prd0OJ+S/qeBomtesh+TBYXK9L63338/0EwSvgMF
         dZMLe+NPc/gS4//jJUV9XQQ6kR8OU2ItEeUdmeYpoVTKaWmf7B+HPrOi2IADVwLc7BY2
         /BB3Nf4suvgiIujup3fBN86uIDgy+WuBa7ilx9nSVuSSzB3h+SSYRS3ezmbYo7fsLSEL
         7BrXL8XA5TKGV4qBb0F7k5vNFtdN8tCMJSgyYfCTipNAVUfUABJTfUtHwYgvhpzyVids
         q4nYGd4TPGJO80Q2PUC89oiPsf5H0EvWNYHSIT43BIQW7v1cVuNhuXLFuhXZ64u0hBLd
         4Snw==
X-Forwarded-Encrypted: i=1; AL+hErFrVS8yPfa4IWvuZlVnXsPNb3d7/PYxSkAJW47zlDJlxTH60rQemMQgLas+5WiLYk+teXbeowYJmWqicdQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Rumlm/1BWiVof2orMyVhHihRmV76fFim0O1bkL09zEp1tfSkY
	0QPZgu5JOcD5pYNQcT8B5Zz3QMMk+vw3g1920NOwOTrQvsAJwfhfRABvEhWv6O2KMbjPIVZ4+WX
	2jO4C+XG9KXzfLJRnEp9Q6VxgQyDoF0FjXHeywS5ELA==
X-Gm-Gg: AZFdTZfckLzrIblO2UnhofZSdqbTWG0oZ9376pA3GZGw4pmk3WYGX0Zi2ywJOkPMePS
	eHKx4s/OxKtYF9OrxiKcyy3GoIGfecaK9sFAqkN1ojdSX98dV9TlX1nlg9uJcyRE2U9mfJsGW/8
	fBE9dxgpYNxrAjVbcRm2iIF4KSVIZ1yHlX9VudjF4bBjp2dwLxBC7gxzc9lYEUmGTra//wX7bGC
	KXsvrEPbxHwQm2boS8wZ2ssByHsXLjgNn3IcjfYF+5xS9JtQJFCh3K/IhlZLDnzGzdMj5dxnPv5
	1I6Lgcy162e4u007b02+414dRLi+o3H0colPO5manwLtAExDFT0i0zoXCdE11maoXPWF+kltl/D
	yxmo37wwALr4WWrxIMCeCzM6g93Ui5Vxa+EvRHXr/vrZ9LAuZ5we1
X-Received: by 2002:a05:7022:1585:b0:15b:7f7a:730d with SMTP id
 a92af1059eb24-1b55690c5a4mr24437470c88.28.1795772417913; Fri, 27 Nov 2026
 01:40:17 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261126164058.2373605-4-ivitro@gmail.com>
In-Reply-To: <20261126164058.2373605-4-ivitro@gmail.com>
From: Advait Dhamorikar <advaitd@mechasystems.com>
Date: Fri, 27 Nov 2026 15:10:06 +0530
X-Gm-Features: Aa3M54pqKM0_HhnbUssU_T72ZIWahp4yBY12MFpBmxas869Jc17TdRiWDxmiqGk
Message-ID: <CAAPs2HRq=BXVabGvHfK33XcCnu1huzkBW8=VxzaJVcz85Cwc7w@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] pmdomain: imx: fix suspend/resume order of the
 blk-ctrl virtual devices
To: Vitor Soares <ivitro@gmail.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Vitor Soares <vitor.soares@toradex.com>, linux-pm@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Lucas Stach <l.stach@pengutronix.de>, 
	Marek Vasut <marex@nabladev.com>, Peng Fan <peng.fan@nxp.com>, Adam Ford <aford173@gmail.com>
Content-Type: text/plain; charset="UTF-8"

Tested on i.MX8MP Mecha Comet with both patches applied on top of
7.3.4, Suspend to idle, RAM and resume no longer hangs.

Tested-by: Advait Dhamorikar <advaitd@mechasystems.com>

Best Regards,
Advait
