Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795477338;
	b=ffzIQozz6gDz3iX415epgrM/IdmOX+NaOzNaLDf1dvA/jSwN3ZSdWmt2IPPBu3Gjx0AN
	 MjGhbIufihdFwrBZNSpo7229tNXobcjnBouyVEpvon6FWCVJulRRNb+rjCGCIa23Hiah1
	 2LhQqj5Ae8Azc6NdhsXY0Bq19TAFuIAhHju8OC5XNo6CmNXuX6J8kAJUYtSVgqaT4Wz1c
	 PEl30tGP88Og05bSSJZ7MVhqlahdgY7whEc82/vg43Dp6iJlXnVkkjA2YifBPpw6omCMN
	 cgIOGnpKzmYTmmiKOzaMx1tjoj/d8ffyuJNqRumJM2nM+i0zmZJAwjwym4xLYkT/06w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795477338;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=fg0tXu1hVUFaqS6DwaYTDlIn6G4vOSL2k3mMwGKArfk=;
	b=I05mRV8mCxedT5RlW4bLLGGpWukHDKPl6Oxjv4ZuWqxD3V1ttF2t2NksXXFcALh8FnDM
	 GOo6LztBraLbZrOKYnbL2EZ/r73QzsgCiNL6Qox5Hxjbprl8ngZnPPQvI5q+Pk8KMRo+r
	 3XzLXElq2j+dtpOZf+bHGZwKqCYRtYefSHtQKNpcasHvAGbQKcPZvEfjr3j+HZg7iIcvT
	 YE8JVY521XbDowPO7474SODoPdEEi4AHaMXgYOR/N77n/58CVZX0ftDD9ymgRTlYNoJfy
	 daqpFzR0IAScUN788ZWsI7RVLL6TAGB3sF7eZVt3XvlEtxHn63yplxLRo98CBMc4qAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hWaTvH2W;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C77F606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 23:42:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C77F606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hWaTvH2W
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-491846221ffso3280329f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 15:42:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795477337; x=1796082137; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fg0tXu1hVUFaqS6DwaYTDlIn6G4vOSL2k3mMwGKArfk=;
        b=hWaTvH2WvQK0Fe/ua18eZbHRadVOMI13PUO18agmTJqMB4Ee7Wry4jK5Bm0cWIHc1+
         oI7RE6JROJdaFFnAersslZHUs/VFmd5LfCLn++EVlhL3IUppbl5KsJcdiQg75nYhIOPY
         yVkcfh1q3meXYK1aNpF34VSxYZg0sIRUuixn1w0IAZdFeXMmJnxKE2B7f4Z1F/lS2kQ4
         csEh3Smr2v0KfcKkT1Rw8azuBMTPsQlVyl4uUyE8UVDk1VdHTHJo4EDKrqGQIn/kaGaO
         /k16dos1+lGtFeW4lKRAGQOvXLya9m50eftp8nWA/G1M+eDknMTwY5mr/v04q+iD0M6s
         RxSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795477337; x=1796082137;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fg0tXu1hVUFaqS6DwaYTDlIn6G4vOSL2k3mMwGKArfk=;
        b=A3r6WGbFVV4MllpisCoV/ip8u4A4Tl7ZZMlkSgXvZAkPkpYRvvXJf9lGtEcvCSuqPq
         MBAJ4G9kTSpM6+mMbbDfr4Tfs/NtgfVIG3zpLhxASAeIrBpgXMLq8GOuuQc0hYN5KOJl
         njPljelidkSLIqlYnIiPKpDdrtJqhDl3YsNczJM4yHO3SVl00EPN4pvVKEnaePQftb6j
         vMKHGW+Kxc9XYSlBE3+bvd2FWVO+7RNsOV2pqHeOpm+nZ7izpRdnXMRy5MIbnKdyBS/7
         sln0pLTzHInomJCQEvn4GGz3G8sgTYF72r3CH9gAdMOg06EynYfqDpCup9UfJUrYLCuQ
         yUlg==
X-Forwarded-Encrypted: i=1; AL+hErFIp7mvJfPlylHRj6kk9jH1t7vaG1wBOsOisq1dUTqKyJs9Tnj9mWGRrfYeALY15wqbkQDknAYL4yx4ih4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/1sZbJwfUoSKDOlOfz+qw2o4nfPHfRv/e0dQNcdvYgLruopo9g
	gPFVH9gP04bcJZXGXcR9YRwEdN6PuYroKjdwTdCcg2UkG48r99x/M2u7
X-Gm-Gg: AZFdTZcsJmnScqXRFN+1IVycm3hHrAqePbMIA170+eFaa90JoddF3G/gVoWy09rO63s
	iMgPNKzDahp0fSal0tJQdrgmYCryx5L12yVimZVC54Ftsh2qBE/syZ90YdQgBU3DvfmdERkWgKV
	JiZRSe7BN8Vo0kw14mVqIAMUOWW1ZCoRTvVuaCPIhqGcwCAqJxfFjxW0JHAgG1dQJOslXh++0Rc
	bz/SPRtGjUDrj2nU5GB+SI0/8n3xOCWT8wRZDxbF9VEEiRR/jBMtl32YpPptL40G+863iAcjD3L
	pXn2L9+DF/5IHChivGhf5TeL9LJgOViXQnu9fQL6Fg+O35RJ++JP+ab8/zX+lTfX1XWsACHry1K
	zxgag2GUA0N+DKN61HDT+N5vG9xuU5nOFwN2z85evCeSzqS8HisdTsQ3aRrrU8OGXJwMHnTVuCU
	uDiyfNUdfWn+w4zlitXEC167CTnyS/UimHwfe3dzG+H3Ro9kTHImlTljvFt2VWKhxT7iokG09tB
	RKHb2dRc/lW4ZEL9SHNrTObLzeLAN/vjudCoMGKHQcB9eOLYFvRkKggwSopeO5j8MlJUixucy2y
	hxKMRnXXfPqjUTaD0wN49/AYQuv5FHR4rt7KoPMVWbrd1SdLhMEFlzA=
X-Received: by 2002:a5d:5d81:0:b0:4a6:f154:b402 with SMTP id ffacd0b85a97d-4abb1baaae4mr25856543f8f.10.1795477336474;
        Mon, 23 Nov 2026 15:42:16 -0800 (PST)
Received: from [127.0.1.1] (ip-024-180.users.dtel.ru. [91.210.24.180])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b110d56sm23777215f8f.40.2026.11.23.15.42.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 15:42:15 -0800 (PST)
From: Fil Dunsky <filipp.dunsky@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Manivannan Sadhasivam <mani@kernel.org>, 	Stephen Boyd <sboyd@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, 	Jingoo Han <jingoohan1@gmail.com>,
 	Lorenzo Pieralisi <lpieralisi@kernel.org>,
 	Krzysztof Wilczynski <kwilczynski@kernel.org>,
 	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 	Brian Masney <bmasney+clk@redhat.com>,
 	Jerome Brunet <jbrunet+clk@baylibre.com>,
 	Neil Armstrong <neil.armstrong@linaro.org>,
 	Krzysztof Kozlowski <krzk+dt@kernel.org>,
 	Conor Dooley <conor+dt@kernel.org>, 	Philipp Zabel <p.zabel@pengutronix.de>,
 linux-pci@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, 	linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, 	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 7/8] PCI: cs7542: Add CS7542 PCIe host support
Date: Mon, 23 Nov 2026 23:42:08 +0000
Message-ID: <179547732839.3.15916995856832702891@gmail.com>
In-Reply-To: <20261123222404.GA1110511@bhelgaas>
References: <20261123-b4-cs7542-pcie-v1-7-4cde5201d404@gmail.com>
 <20261123222404.GA1110511@bhelgaas>
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

Hi Bjorn,

I have worked through the two threads you linked and prepared changes,
without posting another revision. CS7542 has three independent DWC hosts,
each currently with one Root Port. The DT now has explicit Root Port
children and PERST is acquired into per-port state from that child.
Almond+ shares GPIO92 between its two Wi-Fi endpoints, so only root0
owns that GPIO; root1 must not request or pulse it independently.

The sequence now asserts endpoint/core reset before clock/PHY setup and
releases PERST in start_link, after DWC Root Port setup, with
PCIE_RESET_CONFIG_WAIT_MS before training. I also addressed the vendor
menu order, include order, constants, formatting and cleanup labels.

For the MSI address, the expression using a CPU resource was misleading.
The retained vendor value is a PCI bus match token for the DWC iMSI-RX
receiver, which consumes the matching MWr before AXI translation, as
described in pcie-designware-host.c. It need not identify CPU RAM/MMIO.
The draft names that bus token explicitly and checks that it does not
overlap a PCI MEM bus window using the resource offset. This is not a
claim that I tested non-identity hardware translation.

synchronize_irq is for the custom APP chained handler shared by INTx and
MSI: after masking/readback, an already running handler can still be
dispatching into the domains about to be freed. The locked unmask gate
also prevents a late INTx callback undoing the quiesce mask.

You are right about the physical race. The v2 lock serializes the actual
config/DBI MMIO with the IRQ latch and software quiesce; it cannot prevent
a physical link transition before the IRQ runs. I have no independent
evidence that Root Port DBI itself needs a downstream link or reset after
link loss. The confirmed hardware quirk is accesses beyond the 512-byte
RC config limit. I removed the stronger hardware claim and describe the
remaining link-loss latch as a conservative no-retrain software policy,
not a proven silicon requirement or a complete physical-race solution.

The revised sequence/layout passed Almond+ RAM testing: all six PCI
devices, Root Port MSI enable, actual xHCI MSI/INTx interrupts, host
unload/reload and actual PCI-device OF/NVMEM mapping. This does not cover
physical cable/link-loss fault injection. I will collect further review
and leave a few days before the next revision, as requested.

Thanks,
Fil
