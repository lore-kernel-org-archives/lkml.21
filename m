Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795596692;
	b=4Iti9lDuoR286WACeGGnz/4D77G3HGaNttOjgNIuD99BXJG8Q29u29Is+CjkiZnaPgF7
	 wip0C3/qJUmwJ1DwWgwLTXsH889QWUeXiXhjkB/jEcPZguKkZkafx9n6ac8znGvMZXkqb
	 6dOmJNFKLS5XlRndgysrePO8n4stgUf1aDuXxWnhCHu7+hi7itcffJNyANqDhefGp6Y0Q
	 ELEqLLIUMPf2tuVMgW5NBiEMRyI8UfD5lcDbeIjnT6I/1RDNbGHBiNnIoFEmbUsetlhj3
	 CIUX+Px92xcw2fNosxPGJGuvKwu8xJu08N09D7M0fe9OEsMnAbBGeKK9eafhm1K2eMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795596692;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=leW8W9Y5oRbK5oa4kJuWxpI8Iff2iYdyPFQ5BQru5+M=;
	b=SOEyxtC2bHV82qvvHANh2w30WtrKqN4qWtcA9Bd3sMY39debS5q8e4RJW7zRl3ZoAJ+3
	 sK86wHAeyhHLeaiWVwoMEFTs7kzIC4OSXXDpkt2gkqYbsnH7pr0OVkp1ZOdmhCu1GZkET
	 kOSf1++YvynaughvTqSh0nuAUJDpHr4jPo+z5EWZ7AAmPE1vrRv0vGgFAQMJpSVDXqJ6G
	 lHVLDu2yjKvH7lepZpsX9adfgPO0bauBGrTijGTtAgMi3aQ/ZJVSfR29BGS5EcF5TbMOA
	 GeVzTJNkgh2PmwD2XxUjCrhDEepDfBYeMYEihH2QYvak0wP+jI4lZdHnqx7nYevXnHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e6T6I228;
	arc=none smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5092D606A323
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 08:51:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5092D606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e6T6I228
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3ae1da332bcso2844938a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 00:51:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795596692; x=1796201492; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=leW8W9Y5oRbK5oa4kJuWxpI8Iff2iYdyPFQ5BQru5+M=;
        b=e6T6I228mNjFijA6R3pcSSqpOr/m02aqzwmFIkyHslr7sYbbf5f/8uofDwQ7hU9Kza
         0hZk4EOtq+hYd46fzJAHGHC4WmCnolpsAOg8YW54OsxnxpnXKhB49VmYVfSK1ZtGnzHC
         dkV/MfHh0E2ce/CPKYavkEx+Yz0XdQvO58jfvjUO7UodxaXCt6I5KBhg9BCoEXHdNbxv
         z36Quu14jvH6je5wKggCr0Lhu72x8qZATKdK/Fg6dUi9A8QCknr1hdY8oZuEdOsTw52x
         zYaMAZjYETATvVFeEA6wB6cWrMVZpUTK9ZydQH2+oTudLHomoI04Ag8p7nRA/v0zqBrh
         HmOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795596692; x=1796201492;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=leW8W9Y5oRbK5oa4kJuWxpI8Iff2iYdyPFQ5BQru5+M=;
        b=HLA247P7P1CDJBBXIJHNa6ZKBwHG4N48CteSXsAPnaEoozZYlICT4bmHqbQpAQCHdN
         mR/uCAwBgu1lvMoLJAMIz+0GSZW+G9QxWfYOvULjjWRvhLVZKjjFlD43YWuU9NGbaqW8
         3Es6bILC1FHn98Bkt5C3m3Vjf3FUJDGaJ9AgBqSi9oJrtoyJH/3mqlotxBXt04zSdfxv
         tZuzAbcBpQSSVwIgpJ49FDnokXKdRobnXlAgtZka/+ipBuffNeJDtMyuOLnDs18vOpNc
         DzfzWmSTPbtVZZFSNV2mijwc5BfvwnUT92rnZuUaI/asuHR6F3I10Ziomb+luk6AdTMw
         P1YA==
X-Forwarded-Encrypted: i=1; AL+hErGqnf61j64355Zx26Xewtx6zamE0SSfW38wkdy/qoDOes9twf93cPzzHMJlfat9IXW6ySZXiEo9RwB1sZs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9T/J8r+2gTQ74ANM+JgoGPCcz6m65PYy7VddwdJudoPvbi7OD3
	+qWRBaP1X6oUby8sdolr/TtyNuASevSaoZlxstaUxx05znBHJqhScvPZ
X-Gm-Gg: AZFdTZdRt48J9yu/TxfACGauxmNaMX9Hlg5jkolnHDGh1xNgRT4UGlsk3AAEC2bhfy/
	fY7Hn38tYPhqoMuc0kqQbRXtj8C8bxexYp4i1SIFe/UezRgueX7eyLGvyY/AV1vssAfzWXuCSpD
	ymTKlyUIIcmA0cCGdR31+3vPLNi/KqhLG7BZqxmCLSAadlKV43JVPrVuONEiaFjrthxLoXzWYzs
	04YIGXZZsfeXpkw0mU8CBgOvYVo5/I9r8nf8eOL0PFh1qdpwlxDXX6WaXNtHy8+ZdaPNbDRNTfQ
	6tK+0Lsr7cWcy4EeWY0k6LkVXe2bBnSOv/KF2Jp1dF7NBt57bKKbfgmYlkpW4nhO5xlav609STv
	X8uEC+y1rgo9xYV1DI3a5S/jp2GKgo14HHm06uhjHneIBr5eIpdl67WYHMsmlyilWqtumo34ZBB
	RTnKININ2jUWO8hK07NSCUGX0xfx1asLJn2sYN5s7Si3crmXLpcwNFyDxLBRnL2Nd6gFLq7kv1v
	IcpXXlBGlI97rPyYIHedlMz4PGzAlQgD84uoodV8csyLsTWatKD1/ord6OHL67cu83B7Nn3QxEV
	C85Hc+OViqmXekbJJu8Cztcwlg==
X-Received: by 2002:a17:90b:55c5:b0:3b4:5b2c:2959 with SMTP id 98e67ed59e1d1-3b45b2c29b9mr11827069a91.63.1795596691606;
        Wed, 25 Nov 2026 00:51:31 -0800 (PST)
Received: from duge-G3-3500 ([138.199.21.246])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad8e93asm26632567a91.11.2026.11.25.00.51.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:51:31 -0800 (PST)
Date: Wed, 25 Nov 2026 16:50:47 +0800
From: Jiayu Du <duge1256@gmail.com>
To: Aurelien Jarno <aurelien@aurel32.net>
Cc: srini@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, dlan@kernel.org, troy.mitchell@linux.spacemit.com, me@ziyao.cc, 
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	p.zabel@pengutronix.de, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] nvmem: Add read-only SpacemiT K3 eFuse support
Message-ID: <kahf2gbctnhtwngvtwkz7nxg2th2ecisdte66p2m7ukqup7jsj@7tmya5uxzg6o>
References: <20261122173810.2409146-1-duge1256@gmail.com>
 <20261122173810.2409146-3-duge1256@gmail.com>
 <awYHAU239WMaqVKk@aurel32.net>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <awYHAU239WMaqVKk@aurel32.net>

On Tue, Nov 24, 2026 at 10:52:01PM +0100, Aurelien Jarno wrote:
> Hi Jiayu,
> 
> On 2026-11-23 01:38, Jiayu Du wrote:
> > Add read-only NVMEM access to bank 0 and bank 7 of the SpacemiT K3 eFuse
> > controller. These banks contain temperature calibration parameters and
> > other configuration data.
> > 
> > Reload the shadows during probe and cache the data for subsequent reads.
> > Use a 512-byte NVMEM space with bank-based offsets and keepouts for the
> > other banks.
> > 
> > Signed-off-by: Jiayu Du <duge1256@gmail.com>
> > ---
> >  MAINTAINERS                       |   1 +
> >  drivers/nvmem/Kconfig             |  11 ++
> >  drivers/nvmem/Makefile            |   1 +
> >  drivers/nvmem/spacemit-k3-efuse.c | 205 ++++++++++++++++++++++++++++++
> >  4 files changed, 218 insertions(+)
> >  create mode 100644 drivers/nvmem/spacemit-k3-efuse.c
> 
> Thanks for this new version. I confirm the nvmem format is now much more 
> intelligible. The content for banks 0 and 7 matches what is reported by 
> the vendor driver under Bianbu. Therefore:
> 
> Tested-by: Aurelien Jarno <aurelien@aurel32.net>

Hi Aurelien,

Thanks for testing and comparing the data with the vendor driver.
I'll include your Tested-by in v4.

Best regards,
Jiayu Du

