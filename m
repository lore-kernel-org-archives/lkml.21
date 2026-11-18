Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795022631;
	b=CgAC72Av/CbaZZQ/ef4FjyT+C5sAyA6eRRfSDD9zhPBeKBr8b4d3ehIP6zuD5dWBRxHk
	 2es1E5Z72CjNYRSYfUMZMDvsmr9Q2VdC2dxMMOC4mO7EK5inoo9a9dL0KzSUVXhN4i+1O
	 H1Hh3xX4PMP0lVwMWZtSRoCYwJoBK+/q6yNFpGyAJc8t10zT2fCpQzLz37Omm+X85aE8A
	 yYoWCp9ujSgWTYHsgD1iILsREQxK+k252o+pUULi9sMPibgfq53fKOa6vH74n44TnyItn
	 V5TpAK3GjImQ8agzrKM4FJoSDVzabK8fPIoP30ksjiE1w8I8l8oEUQiFdMpgKQ++UCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795022631;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:Mail-Followup-To:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=3ERMpmNBYYI0jhumQ0z6Z12Psr5ML+k/nvEMm6/ASiw=;
	b=S8iaQYOFCpzmzwofC6/5Bw7P53PNHohWNUVRMCQnv6hJu0Td8Vui+v2DhLTAzmLNKTDa
	 N3y/BbOkS0TnvZ/xDwfEs/8Ju6GM27alOY7hSk5sUlPe7CkKmO301/Z6TO75NMQavLq0H
	 oUlmvf7r2e1B0n7o/FJqy4poJuCuvh21RA3tuyyNc3ImaOKU/yiI/4HTEZCfl3OSWnNBN
	 RbN2Zi01WcZy+4wztMA8eId8U3K+ya8mXVkO3cJVFhUFE1xQhj7uwJNgWeUayQbg1G9wz
	 YaqQtXQ1IOmWZipLvvoRQt7g0wU3rBHM0VflDDCuqWjkltOuDDmSprQ/b790zQ6Bvqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dama.to;
	spf=none smtp.mailfrom=dama.to;
	dkim=pass header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=P8GBKFBn;
	arc=none smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD307606A32F
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 17:23:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD307606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=P8GBKFBn
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2efcf92af4fso5277775ad.3
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 09:23:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20260707.gappssmtp.com; s=20260707; t=1795022630; x=1795627430; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3ERMpmNBYYI0jhumQ0z6Z12Psr5ML+k/nvEMm6/ASiw=;
        b=P8GBKFBnxmbf7V68kasovYl9I0n/ZGd1aS9Njk65BYYJhARsPzq69e7u1izq/e8eKt
         J7vaKiTNq6CIuuLohAY7n7DgAsuleyULqYtQMutZzDihW1mO/1GT56Vfj9nOjCnUuBqK
         JyfQK/kjgwaj20rJFlHmhpSdu0j6gRtKSJjb8F+H2Lc0dccIsyHSMQxBW0TADuvwb17p
         28PxRK7LzbN6xlBGDbxwRckImC5zR8Ogeo6VjCqnLPnpFW9Tm+MKyzDv8QNVC4pky8wo
         4iIfm0Mzw8yqFxMV+WHzIY21YN87TzzizlA3oCUiMFMJe00IGFWoqGwxYVzS6p7ctUM/
         UScQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795022630; x=1795627430;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3ERMpmNBYYI0jhumQ0z6Z12Psr5ML+k/nvEMm6/ASiw=;
        b=EVaKMpSxCmBsk0O3Ff7KnOibuRF47/Etk+VT8ujDFJsk8/lmfIDbJjAnOqJY7qvJyS
         /URSeHOwSkf1gFxYq8omnP4VatU0yprF+RK+It3Vi7YcTLBLRaAbOwq0+4Qzst/Q7pDb
         vVHRzLe65i6H2J3BLy/9irFS8y70sKRbuJ0XEEsyGjqzi4YtrZHjGAHfzD9V4ueLlKN7
         XhAyjRkDEbHaAepWmzSmuy0IE6JrMelMAUPwB5X+8CTxaj6iRRMfifhYX53IF+d/i5Iq
         Nq3Oady6VV2flA9JUARtBkHFRModKLR+8LOGKX17KS7fb9+WWmgn0+9Vpn1xMIYMyUvh
         xQZQ==
X-Forwarded-Encrypted: i=1; AL+hErFRxujkALqNodL01pNuxgi9+gEyOE8x8YLnijM2CuiRS3njkk8ggp+J3LHJnPhn7JxqhofOvRPGvg6N/PI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9oFb2HlyDg7wtK1LJW30+yHVN0DDqahTI8/B5xEVSFJFkl5Ave
	by85NqM6BtW/sT59WMEmlzG0volo5m1upMALJswmWr6PeaUgrgZddPNWLsMU7OMfuZE=
X-Gm-Gg: AZFdTZdqLiUKnAQRBub9gzYMAEpX2r9a+zpfxEn+FESibYQzUyjO4gv+ctQyU7Pr9JI
	nNrcA8MjeJ7HMSHgR7I6c0K37nJslGU3m8CwX4mVRz97bSAgi6G6cJSRP7pVHMxNvMTqFMbCXEn
	8xUhwmV7eu3VFQDi+q4JewKLpsKI5HrYb/dpy0um3hgFIUssDbsXBSJbGftlGAJdL1sWDAsuvhk
	FyG6R7yz8ixZCHwq4/3xsFBtMpR/2/izV9EGGlFwPn2yv1ZzbEBqdCdRR2CrMC/eeRLxuKocoLa
	GgJvjc7+JTNqBZ1WZu67Ep4YSw/80vCfehomur4hz+rkws/R1WxU1W93jsGjP+GT3MWccpkQh/+
	pmNUAO51bThSCLuh2NmFW4WWN63kMiMDNAQyETBXDV+0nOQ0EnLLWCjHrDjnRJPprph47uFmOu6
	4+KWNap4hjbnfQlk5vSdI827ojfxmaUHaM9dFXSS5T5XF8BQo2OUdHEgFxinvjWBwU7jPFSlWu3
	2nfjBJTeyNHDF2my66g9F2lcQ84G5tz0N7lnOe+g6F1ypkK7GhB1VyFlkvUHVD7l7IzfT8DKT7t
	wzBScc1S3fOkmauKXwSAAduaJnT9ndRAIpmAlj1fOusG
X-Received: by 2002:a17:903:41d0:b0:2ef:f51c:7b09 with SMTP id d9443c01a7336-2eff740853dmr31348375ad.28.1795022629991;
        Wed, 18 Nov 2026 09:23:49 -0800 (PST)
Received: from localhost ([2a03:2880:2ff:5f::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff61162c2sm17277315ad.12.2026.11.18.09.23.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 09:23:49 -0800 (PST)
Date: Wed, 18 Nov 2026 09:23:48 -0800
From: Joe Damato <joe@dama.to>
To: Changyul Lee <lcy8047@gmail.com>
Cc: Michael Chan <michael.chan@broadcom.com>,
	Pavan Chebbi <pavan.chebbi@broadcom.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Vikas Gupta <vikas.gupta@broadcom.com>,
	Andy Gospodarek <andrew.gospodarek@broadcom.com>,
	Jacob Keller <jacob.e.keller@intel.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] bnxt_en: Fix auxiliary device leak on early probe
 failures
Message-ID: <av3fJLQd8P+XlOS/@devvm20253.cco0.facebook.com>
Mail-Followup-To: Joe Damato <joe@dama.to>,
	Changyul Lee <lcy8047@gmail.com>,
	Michael Chan <michael.chan@broadcom.com>,
	Pavan Chebbi <pavan.chebbi@broadcom.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Vikas Gupta <vikas.gupta@broadcom.com>,
	Andy Gospodarek <andrew.gospodarek@broadcom.com>,
	Jacob Keller <jacob.e.keller@intel.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
References: <20261118050716.3873167-1-lcy8047@gmail.com>
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
In-Reply-To: <20261118050716.3873167-1-lcy8047@gmail.com>

On Wed, Nov 18, 2026 at 12:07:16AM -0500, Changyul Lee wrote:
> bnxt_init_one() allocates the auxiliary device ID and initializes the
> auxiliary devices before bnxt_set_dflt_rings(). If that call,
> bnxt_init_int_mode() or the bnxt_pf_wq allocation fails, probe jumps to
> init_err_pci_clean, which does not uninitialize the devices or free the
> ID. Only init_err_cleanup does. The devices are never released, so their
> aux_priv, edev and ulp_tbl allocations and the ID in bnxt_aux_dev_ids are
> leaked once free_netdev() frees bp. A VF probed while the PF is down
> fails this way each time.
> 
> Add an init_err_auxdev label for this cleanup and use it for every
> failure after the devices are initialized. On the register_netdev()
> failure path the cleanup now runs after bnxt_clear_int_mode(), in the
> reverse order of setup.
> 
> Fixes: 2e4592dc9bee ("bnxt_en: Change MSIX/NQs allocation policy")
> Signed-off-by: Changyul Lee <lcy8047@gmail.com>
> ---
> Found with a static analysis tool we are developing.
> 
> Compile-tested only, with x86_64_defconfig plus BNXT and W=1.
> 
>  drivers/net/ethernet/broadcom/bnxt/bnxt.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)

Reviewed-by: Joe Damato <joe@dama.to>
