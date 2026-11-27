Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795771054;
	b=O/XO9ljz10xPEYKPsBYvUdQYLkWDPgUdk2J3UwDzo8qx3J1R9DnuzGyAmZu9at+rup1Y
	 fwqpbVWqujEK2RAGQ4apQ5RyxaLJE1A9182Uo478SnxR7UMaJ1JcHqvkBirrc3a8D91yt
	 60kgshExIfNE5DpJtkdDskkCW786XPnywD67Cbmkfq9TvLlYkNHVk5Ju4OTsO0PkhL1tO
	 fLMskqFnLj6jm6w0Vj//IfKIFsMN8TnGWs95KrBMW6jcNzNytI5VFh+w0s8s+TCobMFVP
	 4KhTIs7Vq+KvLEbAYBzga8yZpYmn8OcyxkYSiX/hn5pYMe5zDb37YVNLngoAI0ycCLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795771054;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=iJDwnblXoPc0E7sZTKvXtcZa2lLf2LQdU3Jx0B40YZ8=;
	b=MTHFFKRuThlnsGr5C/lglUpE8J2Rsh+Rx82Htl+X5OgK0h2wbInUVFAvhMoQgIFgJyYj
	 NkTfnsctu0dl32is6ouFPlQQdjIyOAvQrxMK3GAYpN7Xg+1uUTCs7yEnOo22nzWcfq6/7
	 kdYvRK3tc25MOKU2i9PffoNBUJOnKeIRqO9ga/UyBEnbK++EUwcRnfTLJfP/xhOwwO6qg
	 mZx0ES0B/p/nhmiHA0yWrR9h8ZoHOlzFxLyws+EcHL6u1BkfQJkJj+yuUF0GAaDcfG4IC
	 lFKshBhoCrwUCF9KVBP+C3G5AOtW2cO4B8wq8K2JqzuGBY+MeGBohXyoz8Msa6+7aBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=tuxon.dev;
	spf=pass smtp.mailfrom=tuxon.dev;
	dkim=pass header.d=tuxon.dev header.i=@tuxon.dev header.a=rsa-sha256 header.s=google header.b=aI0lqB3a;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02781606A31E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 09:17:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02781606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.a=rsa-sha256 header.s=google header.b=aI0lqB3a
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so45688665e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 01:17:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1795771051; x=1796375851; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iJDwnblXoPc0E7sZTKvXtcZa2lLf2LQdU3Jx0B40YZ8=;
        b=aI0lqB3aCQ/4qBvwVRrDv3T2pKd7GIXvwQaW/Zh+LDPEWa17gOnnrr1BRlBIiBDLGi
         3xPfRxJaZjTyG/xvFc3dneK3xD/vNNrfe7lzCHKDtGApXlb18j3sVqNfkNpyZlK6n953
         YXQWqBLq6DgnAMebNL03Z+0dRUS7k1lzTKtoLXWxp18A2ag/Vuu/j9v/pXqDglpge3+U
         0aSVeDRd0euIBB0pClkJqh+3k8ujN4D7hiwgn+JHi6wQmvh/EL4Kk4CFcoCmmj/IueNy
         dsgWcm41bUvXD8zNf1yL+83BWKY+VC6T4IQuzt9lZYBAlNR/nIKXUaaUworjOtwk/D1z
         Ktag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795771051; x=1796375851;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iJDwnblXoPc0E7sZTKvXtcZa2lLf2LQdU3Jx0B40YZ8=;
        b=xrmsOBffQ07thoWm+Px999jYfAy+ot34U8yHc0ji8p5d9cMqxxkhfRUJQRT+NTFwRM
         VbnRX3fpx6qmBxlsjZG0En14fFNUS8YqOruunfn55bg2oMdCtXvBMJlOv3r94G9ksIha
         46bIUJct9IobaLFq8aExbH6PNU5Tc5s9PvxAGsW49s+5B/YrRf9yTTMs1iFx2zPL/qjt
         0Y/E3Ojt3U3j9zj7kiK1sy4tRrM/P0yxSqVYv5Wdto8kblA/GRTAEzd+ZEP5/CktHpcz
         zCHzjyhDwKReeLqheRbWfhN5PX+e/ETplZ+YBoozTGJ0QrndA2m7cQ3mI7cDir85iuAk
         zBwQ==
X-Forwarded-Encrypted: i=1; AL+hErFfkfw21fxVXfTya3t/KqtolhVWPLfgo5RyIFsPAZgHGOL8fUVLKjX6wVCPdkgc90qQmhK403eL1R25Zzo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/t6E1Z0T6RJLAef62U3Isjk1+Tp7nmGzQzmgEzk4BIPCuc19N5
	ltN7SeD+hrFiQhtVNv2POXbU98IbtzqmqGgFIH8NNerDwYQMxvHQXrvZXdU9uYzB2uM=
X-Gm-Gg: AZFdTZePh/PyalYMXYfWmng8j3wfvDJ0pAojpRqm0Ekqkq/+f9jtgAibOyVAoDRoc14
	SpBLOoSMQ/eUKoVFWkBbgUoKb/wEX/e+v3KSCWBfX391RyURKW0Ludq18HeDtKtnOHUReKUPcIy
	2DloFK/tR9PmdpXG5LlhXqyjNA6rq4OUTF3rOz6rqhhw381j8YNHHY/oiU63Q4PjwPnl3ZCqUZN
	hAwZpkrmdIIaYux6Nb/uahQWsokMGKe+Lv1djA7blfduPh1MO18JP9474ZCQGEJ4QaALepTD3Np
	aZIsp6RyZapInvPGTIj447RUPbleU/DpDh8MjX6e2t6CFLtwlP7NlBHWoR2NFPHsvuieFBEsdtU
	qS3ZL9RFT+UwddKctQ9CRi5mB1D3JOCLn0+nQOQ7Q0sBRlcCw4mIAgrKvyeOQ6qDdMDZ+PZMgg7
	iJX2FZI2+95++vZtZiB/gwjtcUBHLfqvX/9IotlpCSPlByYeFnIb80DSS8Vxg+lyM5nD2m560J+
	LxgaZUej4YP+mej4Ed1Q57OrF1C2xDLx3ZZ8QZne1D9Ea02PKtFpX+x1oVvWu6TQRDwLho+wRSr
	iHMo2DrMX9YtjIt5RNnB6nSO+PSPyuSOu/1w
X-Received: by 2002:a05:600c:1389:b0:4bb:7347:d5c0 with SMTP id 5b1f17b1804b1-4bb88826937mr438432725e9.9.1795771051464;
        Fri, 27 Nov 2026 01:17:31 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.114])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8526cbd0sm896151645e9.0.2026.11.27.01.17.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 01:17:30 -0800 (PST)
Message-ID: <5c05644b-fcf2-41e7-a012-338ce7eec8d2@tuxon.dev>
Date: Fri, 27 Nov 2026 11:17:29 +0200
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/7] i3c: renesas: Drop comma after OF match table
 sentinel
To: Diogo Ivo <diogo.ivo.sx@renesas.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Linus Walleij <linusw@kernel.org>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20261026-divo-ssgrlpcsrc-2966-i3c-v2-0-2e76b87209bb@renesas.com>
 <20261026-divo-ssgrlpcsrc-2966-i3c-v2-2-2e76b87209bb@renesas.com>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20261026-divo-ssgrlpcsrc-2966-i3c-v2-2-2e76b87209bb@renesas.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 10/26/26 13:35, Diogo Ivo wrote:
> Drop the unnecessary terminator comma on the compatible table.
> No functional changes intended.
> 
> Reviewed-by: Wolfram Sang<wsa+renesas@sang-engineering.com>
> Reviewed-by: Frank Li<Frank.Li@nxp.com>
> Signed-off-by: Diogo Ivo<diogo.ivo.sx@renesas.com>
Reviewed-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
