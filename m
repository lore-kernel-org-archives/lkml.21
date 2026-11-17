Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794953735;
	b=LejrapT2d1WXIzV2JDKiSF6UxxvWKYANJSTcHV94EMiDsS6VK/XFUL39sSPEQ2WBvV6y
	 pqgWl3vqevmDTn+e7DhjOZfcehoTGB/W6hjsczhHH94wwVZ4kf3XsIX4/vnHQUyOCnssA
	 Gl4fl/ax+3qhNG6iIox//dhNYJTb2PqTmp/KROannu+EQM9PvykjpnrxONlOC2dPdPdRL
	 ol7G7jscUoEB1LQaV6cwgKipYM2NK7JY5S+tjs1Zgyov+hzmS6Dn80rBEVCN4fjVwnvSy
	 tcOYkTRF2zvYNEE9rD9DjqTXbtUWoLzBW6DqP7XPjC55bwR2oDULZhashWNGFnCJ8Hg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794953735;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=AFP+oprX2JfHEH4/+I3VRIaXxkKhreRWUhH9rG04Zmo=;
	b=TMXY4zNLcisahRvWH9ZR7Jb9RTgtGD1OOVVsy3Ivdag66cQn5SxCu6TMXbo0UVRWmzar
	 FaVCEx58GEnlN3hdQtTN2S82Y4pE/c3F1aHY9b308fUVyxlm07ldiBcpmSuXwljFMhoQJ
	 UBmXdtBuPwP62NGiT1kMt30t+wCdHMkDgBx7cOYzY+zCy/o/0+l9aIlT43n9Y0iRkKq9q
	 l/zjJ+g81keMdW+gSFtzZsBoy72VRfbaokxX2gk2An6njMH/rORsUi+KirtREynxqW0YN
	 RdMfvoFw83NvYwkfBh/vtxrlyvQ3IijG2Wuv/w7O/vJYnNJCU8y+/ywCHBxEvHdytVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YlofpBdx;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A11B7606A32F
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 22:15:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A11B7606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YlofpBdx
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a210470b49so2847755e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 14:15:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794953733; x=1795558533; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AFP+oprX2JfHEH4/+I3VRIaXxkKhreRWUhH9rG04Zmo=;
        b=YlofpBdxcRIXvu5cJ/kkVBkDOJ7x6iCSTMHuNVHP14QSPtUPXkfJOLBtKAG2vYvKHm
         FKWooWNn4U+Dm9hxOxobcBNiu5Ap2+m/ZIMjWDMeJ3j5+j0t2v5Q0rEpkElqlduz7tJu
         UHtZvrPa0EPYEo8OanDAubeBaOZsSK1kdZFstCfuNkA4kRzIXoowloKMC8jv+rLFj75z
         2PdwO1nVZ7+BdkzwSzG32d25RAzNVyOWkrDv61rYSZ1wn+jZu66rXIlKTo2SLm1uQLfj
         U4UNt27YC3Eh8G2ivlLGyi7lEAD9oay6fFH96Yo/J2n/MECh3a8LdAuZZNPMcKscap6e
         K4fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794953733; x=1795558533;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AFP+oprX2JfHEH4/+I3VRIaXxkKhreRWUhH9rG04Zmo=;
        b=gaXhZDPuGo8XUUGss5KKBEleiIRQY2rK/ichH5qL1SGE86KpQIzEd7E19DHDqFx3DZ
         k3fQ75acdVUU0aPOMKyOUlcdsUWqypEHu2AEEf00UMTqKDoinQ3KpVfmRX/9EJYmZ1F3
         aapM7NMVn7+ixLROrgeYtoOoDyvR/Y4ZnICPU/VhB2I6jEk9ESvzJtroASZNUUo8Xuhc
         MmpJ7Gg3W9xlzGjITDiIUYEoQJiAZjx5f8KiYIXHNN9MYGhhkRehzAo1bVIXPBjR/uDf
         npcNC4ZDfTfY6LHHcadLbBmNBH7QglLEWJpRtTErC/xjD7710THiy3kDDSq6Bz+s4LjG
         QaVA==
X-Forwarded-Encrypted: i=1; AL+hErHP1DKsNH7ETCVUZJ7da4dOqGRIWRRVbAUxeN+FK6iQmc1RJeG0yYu040/VO4ziLu94DfdzuxB8s9Uvdz4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Kc6cm82eUGDyAQifZbai/0GLxwO7iKWL32V3vXIJtSrHAZBp8
	7Yupy1QuypRH5eaFSr5RAAk3qSV4IEV7OSkJijh4nLv0FreDinV2KN4J
X-Gm-Gg: AYBFou2DIpI4jZkyUR/zId3qMCqxaeR4JN1+deZoH/mF8nj8yAEh5oNEIufoJEA5zg6
	JL9hPKpbsrSqXDBjd/m8fG3qARcw5crPnnh44ewQ/pDS62CJmr4D5jCJ8cicvwUnJTHRa9Rq8M6
	+f2oB1BSkF66/gwSMRmUB5p/PrZPYfZSxJ82qI4+hb/gJsCh3SG6Z9OzS5LVsf5GEGwPqoEVGIV
	vOCDIYY6j2BZ7/hpZ5+1R35fAYRzWN5ajn5pAd8aHEIisDgCiVQOCflijgpBb+sorVF23NmuSdq
	9YolCZDBu9A10RbHGhQN1yX5rZWMv+x4h5kqW3A8atFpXptzfeLL74c0IdY593yOpjxrYt1Baxl
	PJv+w/tJz68UHTsuX/HXbqHHjuyyUZHdoE2FqBvKRUSnqFd757m5H4zv1rIe4eTl1+kC3jdj5DM
	N1PuUxQMr6cfbqX8qhZdrHYVuPC1cuQuHOan0/Q7RXhcw3OrGc1HeiKI/9GSPqaFGaHVeEucIoO
	zPvmFGIoM2b8/tyUWNOlPR3sg03H+8ld69xo9pYGnbERSjGj2G5VSN0DJ8qTDaJR35/0NxaxUu1
	3ANXtH2kvv1ANzT+y6seqv/BJbUoo2tbtvdzrSV3nZaYWGUD7RNNHVa9C8AxSJRgLg==
X-Received: by 2002:a05:600c:698d:b0:4bb:6947:3e1d with SMTP id 5b1f17b1804b1-4bb7da2c0a2mr9913865e9.20.1794953732442;
        Tue, 17 Nov 2026 14:15:32 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb783f7eecsm171197495e9.3.2026.11.17.14.15.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 14:15:32 -0800 (PST)
Date: Tue, 17 Nov 2026 22:15:31 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Manikanta Maddireddy <mmaddireddy@nvidia.com>
Cc: <jingoohan1@gmail.com>, <mani@kernel.org>, <lpieralisi@kernel.org>,
 <kwilczynski@kernel.org>, <bhelgaas@google.com>,
 <linux-pci@vger.kernel.org>, <robh@kernel.org>,
 <thierry.reding@kernel.org>, <jonathanh@nvidia.com>, <vidyas@nvidia.com>,
 <cassel@kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH v3 1/2] PCI: tegra194: Use FIELD_*() for register fields
Message-ID: <20261117221531.26d6e0d2@pumpkin>
In-Reply-To: <20261102092238.3917883-2-mmaddireddy@nvidia.com>
References: <20261102092238.3917883-1-mmaddireddy@nvidia.com>
	<20261102092238.3917883-2-mmaddireddy@nvidia.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 2 Nov 2026 14:52:37 +0530
Manikanta Maddireddy <mmaddireddy@nvidia.com> wrote:

> Several Tegra194 APPL and DesignWare register fields are programmed
> with open-coded shifts, which makes the register programming more
> verbose than necessary.
> 
> Use FIELD_PREP(), FIELD_MODIFY() and FIELD_GET() at the Tegra call
> sites where values are shifted into fields. The LTSSM state constants
> are converted from pre-shifted register values to unshifted field
> values for FIELD_GET().
> 
> Suggested-by: Bjorn Helgaas <bhelgaas@google.com>
> Link: https://lore.kernel.org/r/20260515070753.3852840-2-mmaddireddy@nvidia.com
> Signed-off-by: Manikanta Maddireddy <mmaddireddy@nvidia.com>
> ---
>  drivers/pci/controller/dwc/pcie-tegra194.c | 137 ++++++++++-----------
>  1 file changed, 67 insertions(+), 70 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-tegra194.c b/drivers/pci/controller/dwc/pcie-tegra194.c
> index 26e2ac5c5869..62bbfcefe6fe 100644
> --- a/drivers/pci/controller/dwc/pcie-tegra194.c
> +++ b/drivers/pci/controller/dwc/pcie-tegra194.c
> @@ -51,8 +51,7 @@
>  #define APPL_CTRL_SYS_PRE_DET_STATE		BIT(6)
>  #define APPL_CTRL_LTSSM_EN			BIT(7)
>  #define APPL_CTRL_HW_HOT_RST_EN			BIT(20)
> -#define APPL_CTRL_HW_HOT_RST_MODE_MASK		GENMASK(1, 0)
> -#define APPL_CTRL_HW_HOT_RST_MODE_SHIFT		22
> +#define APPL_CTRL_HW_HOT_RST_MODE_MASK		GENMASK(23, 22)

Changing the value of a constant without changing its name
is heading in the direction of a a recipe for disaster.
It doesn't take much (eg a partial backport) for things to go awry.

David
