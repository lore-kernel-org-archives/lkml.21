Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795518179;
	b=1OFACWIFn0Tq727EZrgh8AKmUd5al9zTGcNpbFxKMu0OJSkdjWKZMfGHgYTmizsIrD8M
	 IEgn84BYRSPDMw/ZaR6HonUI/UL5fFQOrIr1MAvj29/kWJbiH5ehPUvK9SZLc9DeFdD4T
	 mLIILcn68dRYWRxPZB1nRMXNr9gVfrAPhgTs4izQWrPe/BSSQPMUhkjDQdes8E41grslg
	 RsOCONefAmH9frhazytp+d6u4PEot0R7Lw8+RcJB1hWK2vgGAMOTcw+ulW8L5QHq2+1oD
	 PTQMZbvYliJUgmFWT8EEjCtfWWCrcvXa+9kgncTv3hR7IENMuRyWOUMc111dWU9x+Fw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795518179;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=mkjJrkqN7PSqt35Slo7/CrqzZ7y1RXzaSbB1kKd5fBw=;
	b=WRqK1a6Jv7fjVQY4JNND5x6F71sJLZFQQ8NIejevDXFWTRD9LWFTOXM2phiMLOaTOWeH
	 BciSP+CVmBK1cyzZZmFJnJLzA2YdXXMkWMaDZ0/2wjQIOYyOw3VjRb9PpJmUU99zHDvNs
	 KMUwpv+gxtBGWdj0C2SvSWChFWpy/BJwpcEfEo/GDFmAuXE7CUmSb7GAF4MaYrjsvcZcf
	 MV1m4RDt+WZRFA1XI6aCw1AVOhNtOcXUkxDOmKijYxQUOMwcFObvdNLNg4tSaAJ157mnV
	 aiO9Q7QHYatvKLhKyzaHH37Y4VxYUt/Uc/lm3zL0yqPebn3SS7Ke81CXcQ4GeXer6rA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Wb8zRea/";
	arc=none smtp.remote-ip=209.85.217.43
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71C74606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 11:02:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71C74606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wb8zRea/
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-7d2ccd3c7a2so1384868137.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 03:02:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795518178; x=1796122978; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mkjJrkqN7PSqt35Slo7/CrqzZ7y1RXzaSbB1kKd5fBw=;
        b=Wb8zRea/Uk89t4+0eAHLNr3Cr6gX/61QeaQp258Tm7Esv2rsyneDZboZYWCdKpvA/o
         FrbFbyuQJ//Vmvdo0t9X+XcsS+0ztejEO2er5TkJ46I/8d6w8gRKw6O+YY2ixzEpsTzD
         WfHOtyzjSLX4LeoBtjXk4sCYQwukz+8SLm5Zs31HoGpKyRyB3EHSG3YI2vw5WyJhlVQS
         1GB3nm1COkBpJsu5iLGIwL0xl3UNuUz4TgHjJ/CBhd7NYGhNZNH9qMFV1CgdU7rv5tKP
         whwDkmhQBdtUziwMUDsrK+f3nh07MJ/51ySatl2NTARQaVOBIQ5kmOgod7XcfL0cz+wM
         S51A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795518178; x=1796122978;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mkjJrkqN7PSqt35Slo7/CrqzZ7y1RXzaSbB1kKd5fBw=;
        b=cX+5Cz1U9qPWY5BLahfzCM+xYM3VaKI/778wKzXYryMDNGdd0rRwn+M3PBIwYJW0H3
         Z58LRkC6moI8UfX+eY2pneNFfCjCMBn+/vt1GkslKPw0sETTOerVv5isvPH2imSnKWv3
         /ArrSK2HtYxipvbzXsUnydWf7RENQcFaYPmUTVKP0Rw8vNkge01vYdqDuLbGiLd7x4cb
         5hkVqo2n2W4vS7oCoYmjKlSketIk85tY7KZi1CLvSk2p/C+poPgEi/SLql+hme66lUqb
         k+YLbNVMkgrjj/a8qKiOdKVriPNEgzRISY9MYwui2EGSZFq0M+bLh4d+iOibp1Jt/cdJ
         CR5A==
X-Forwarded-Encrypted: i=1; AL+hErFqtNcphVtOijlQULdKyeALACIBLHdCwhmW4J7sYqu8mCTM7iMgQeEteiFPJqyGZaaZlDpy/WmtRhYh7S4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8v3EI2zLpHsiLoxcaC5pAQDHH9B6JfH0k5z8sHnwcAiezLZUiM
	R9RREoAD2Oo+UgGSutD3oYvgjDEcxehqya13cbo3mB8jw5HH5gFEeujN
X-Gm-Gg: AZFdTZdJbBAolu39rB6oAYXxKJJZX4OCNdbzW/0OeqplrYJ3eJNM8Hdt5ELN/upSX9Q
	7GCyO6iAczGANz5n/qX2Vo/rJrkkq2Cz7Y09JgehvOpT3iJVc/hwGjxhPKuSV8VJhvTAYXiv/Fx
	o4bgSyR70UE8oG83XzlwONUqeIxsnABi/THvEMuj4XmLhplc6Y3sNiYlvInr69OXtjezhppChYI
	Vn86aTWfzwoVCH8WEnUVXgqwqyacBNm0oDSn5ruMlSgDk3MlUoF6AJ5+jDfa3ze5KnzZdL8sWZZ
	TUjiGNHOVjQOqsn9sKrG1J1FKGDDnkX2u9Q5ZycM38CLRmELHC07IMlRCLuF43rLtDMME1EnuC8
	3ifrqpanPrmnm8MqJSeM/raFFp5O0/cMmdQLrBHDkqAu+KpXcxJqh3SVNIhmZuKMZq30jDZBpFz
	55d3smsM/9GTAUfXQH0G6eqjieyI0qHk65I35P+FGeUeg5kmgiqDrCRhR57vxZuqziZl67bGSNK
	iWld+IqCAqzw/A4ImKtP3uMdVH7J9dzftu/eWa+uDZneaO3diFpjRDg6ev7LqdIObdJa2V3zS9o
	uf6a7wdjtY2Ie9C9uCCqDemzHlj59PwrELlGzuXSo6ZIF81RPWkKP4ak45t+BVasVJs+C8WyBPP
	bmMIJla3MoAnVuDaa4G9I7bRAcwbUmlQNsKVNv3unCsEEbn/8
X-Received: by 2002:a05:6102:54a8:b0:7d6:56d3:f179 with SMTP id ada2fe7eead31-7d72b361a74mr6083753137.5.1795518177851;
        Tue, 24 Nov 2026 03:02:57 -0800 (PST)
Received: from localhost.localdomain ([2804:1b2:aa42:30d0:da53:c2d8:5b4f:38c1])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d6e8265e55sm14978477137.11.2026.11.24.03.02.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 03:02:57 -0800 (PST)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: Enzo Adriano <enzo.adriano.code@gmail.com>
Cc: Andre Przywara <andre.przywara@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Pablo Mazzini <pmazzini@gmail.com>,
	Alexander Sverdlin <alex@sverdlin.org>,
	Jun Yan <jerrysteve1101@gmail.com>,
	Lukas Schmid <lukas.schmid@netcube.li>
Subject: Re: [PATCH v5 2/3] arm64: dts: allwinner: add A733 SoC description
Date: Tue, 24 Nov 2026 08:02:31 -0300
Message-ID: <20261124110231.15528-1-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261121-a733-cubie-a7s-dt-v5-2@gmail.com>
References: <20261121-a733-cubie-a7s-dt-v5-0@gmail.com> <20261121-a733-cubie-a7s-dt-v5-2@gmail.com>
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

Tested-by: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com> # Radxa Cubie A7Z V1.11

I tested this dtsi with my A7Z board DT on a v7.4-rc1 lab kernel with
some of the posted dependencies and a local pinctrl fix, not the full
list from the cover letter.

All eight CPUs came up, both A55 and A76 PMUs registered, the PPI
partitions were recognized and sysfs shows one cluster. MMC0 ran at
3.3 V and 50 MHz, and a read of its first partition matched the
reference SHA-256. Two card-detect hotplug cycles worked with
GPIO_PULL_UP and the local EINT-mux fix.

I haven't tested the new I2C0 PG8/PG9 pins, PMU counting, EL2
interrupts, ITS/MSI or the A7S board DTS.

Thanks,
Vinicius
