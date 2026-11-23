Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.211
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795440701;
	b=bKVRgOopRgotJpDN+teEEFhJ4/z8SV8XeKRkirZbIRMmLSZS1ddwhMhh7CUC6RtPMoIj
	 QobblfgxhWRwnJhqvfXSVLT1QUEGVcSnAz0T77BHe53QksuAmGE1TMGXVQRz+6DZOXmHq
	 /Bg1hV3+TsNAFYbDx0Hyo6E0VGQGyGkCesBcmjml3eMUX8f/JEXl3GyvHboBkLQA+nz4p
	 z+TQroE/tnzt5z1CsDTPCO/Ouqko3wumAz/QZvq99BhGLVznqHhbPitD8tffHtPqbh4lw
	 Ge2VdFuk0ejehG0qZojz78veBnH068/lu6nXr5VdMnr3d4qZg7aV8fkSRRitUgL8S7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795440701;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=hE6L91J5Szg1VQETyjqGGoVl/6tf53hcFvWX/NKBz1E=;
	b=3Yqxt4joOHUQfykuyBH8/vIbs9RPG09k9MECMfwUHaaHBTnyGkP2FSuES0DRWG4meJPu
	 OK3enG/6XghWgp5oViONBZkHFkw0qGADlpg3KlhW1Y3O1TXGarZfAivE1xXf0ZLLX/RCx
	 zLJHHd2ZWzSJ+OlW77Da4GJVn7Nhn0nLE/xOG/kcld399BBQdkVNlv0zRRUsys4mnmVle
	 4+oRug02gUYSKNDlhBWg+SbQnvVyCFo5UdD+GmWjxMW53QcNx+HP7r4lsPfSH+pBZ3XAv
	 GNzyEPevECwW92FfuBmg8JJop7QPNBV+EOXUWHhqA8/vPHfX/ttmUgjQiNfUJSZFRig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=FYEr2mW0;
	arc=none smtp.remote-ip=95.215.58.211
Received: from mta1.migadu.com (out-211.mta1.migadu.com [95.215.58.211])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDA9C606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 13:31:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CDA9C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=FYEr2mW0
X-Envelope-To: linux-kernel@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=hE6L91J5Szg1VQETyjqGGoVl/6tf53hcFvWX/NKBz1E=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795440698; v=1; x=1796045498;
 b=FYEr2mW0PPokR4CVyqFspOLmMZFb1yT2dnoxrjaMX3jv5cZFUVDnbYs5DXKh9DTFH6M1XLU6
 +U3ACUp4yFFKF09i5C6zbb+DzqZhnUaDYSsH/4SQn3SFVeDjL4uZKe6HUAUAUVhB8mjrc1FzXUj
 yH9iO2XSalADzu+G9yLdYtaM=
X-Envelope-To: linux-kernel@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id d2e4a321120fd626;
	Mon, 23 Nov 2026 13:31:38 +0000
X-Mizu-Trace-ID: d2e4a321120fd626
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5c144eb2f43so8550e87.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 05:31:37 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFFE4WgU0rEBgOIGCjbrKzBZas7vO9owi1vs5DLThRB0uqE7HX+EuhOgJZ2e3LCo0k7xo81HUNgSllDNWA=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Uc2vs5je6uzawQkDctubR/qf8M8PIukeEye7y4IAiAV4ohBuN
	mCRIwpd2q+aRjurMUv/7hAAM6MyEaJp1vlWRXJKvrGIkvjyB66EeT5SG2TcXoMklvK+XX9prO73
	LmUsboaWjRZb7qP/WcAyvSSUi6gyC2v0WeAKM/apv
X-Received: by 2002:a05:6512:2249:b0:5c1:ac5e:ee43 with SMTP id
 2adb3069b0e04-5c212394558mr168130e87.3.1795440696369; Mon, 23 Nov 2026
 05:31:36 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261116192933.3266502-1-fuad.tabba@linux.dev>
 <20261116192933.3266502-3-fuad.tabba@linux.dev> <a8d84ea8-c095-e444-dea2-23b92866f970@huawei.com>
In-Reply-To: <a8d84ea8-c095-e444-dea2-23b92866f970@huawei.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Mon, 23 Nov 2026 13:31:00 +0000
X-Gmail-Original-Message-ID: <CA+EHjTzgHrodq07u0omn=A+XL9TqbJXTE3QSosz8gicNjFxkuw@mail.gmail.com>
X-Gm-Features: Aa3M54qhI4OsITxL3yzRVRr9_MTGOX2UfSXre8ktj4oZaW-PPX9DfohxKOkt_8I
Message-ID: <CA+EHjTzgHrodq07u0omn=A+XL9TqbJXTE3QSosz8gicNjFxkuw@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] irqchip/gic-v3-its: Clean the GICv4.1 vPE table to PoC
To: Zenghui Yu <yuzenghui@huawei.com>
Cc: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Steven Price <steven.price@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, 
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Zenghui,

On Mon, 23 Nov 2026 at 09:17, Zenghui Yu <yuzenghui@huawei.com> wrote:
>
> Hi Fuad,
>
> Thanks for Cc'ing me on the GIC stuff. I'm happy to read them ;-)

Thank you for the reviews! :)

[...]
> Nitpick: would "irqchip/gic-v4.1:" be a better prefix for this patch?

I'll use that in v3.

Cheers,
/fuad
