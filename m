Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.125.188.123
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795406985;
	b=kDMbfVBnzOJKFmtAG1Qx+HOxUJ8w6LdimSxOrjaYJOZdtMFY1aCZG86YVJu6nvlaZwQn
	 vb2N2JC8asHFfwYBkQP/fZlkxORUvq+oyw/nZRsoDgwzuo0969ES5XUjKJ+q2hfbra0r2
	 98c6XV62O/Tz8tAhJu1LGCFnmIRo2umQPjtf9Kg2nYkgRKSIn+9Q7FLfXyaXSOsmlAAve
	 8cUhcT5emC4vNqMt55wEcOrzgQhINEiNH1dCZ9YQcl/YCRFKRwRSiysV4ykTqW0Lrr0hh
	 ev4df9EvCWqkjjmGQXqDwnDFH+xqhKwzvdwtRGAFgXWFRRa3GYdHAnN5Q1UBjF64aUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795406985;
	h=DMARC-Filter:Received:DKIM-Signature:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:Received:Date:From:To:Cc:Subject:
	 Message-ID:Mail-Followup-To:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=YLKmTz9mXxZ44RenvTwUZJjRcB/29lTMpfzoB+6Aoqs=;
	b=kEb7A5IMM0IOxPD8we3kXyN4LKSt5jhWiWBM/SSgYATeneWovHbifpl0M4IN7b4JHWta
	 v8H9hMLfH58LQkn5vx4fbod5HUSQgw1yGba7w8a5S2GUeCC11EbmK/c9jCq4O6zLvWDp7
	 swPaY7e4A9CrSGBb76Td0yD3TmmhDrKIs5pTpLqZcjJMlrxHunW2uikZ3eYm8JJDmRIk3
	 ILax3VrUSfMoWImr8tf5hEWrID1kAHPqHFy1hwmdJMqzkrNLycrBSkmuL/50fVwUnypp9
	 tbKmpP9g8NGuWKGCVvBo3BmNA9ciFTakeFqHQT2OBJ17coVynp4MMhiGz/uNUxQ7alg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=canonical.com;
	spf=pass smtp.mailfrom=canonical.com;
	dkim=pass header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=FWIRLrFU;
	arc=none smtp.remote-ip=185.125.188.123
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2180606A31A
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 04:09:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2180606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20251003 header.b=FWIRLrFU
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id AB7753F1C0
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 04:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1795406976;
	bh=YLKmTz9mXxZ44RenvTwUZJjRcB/29lTMpfzoB+6Aoqs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To;
	b=FWIRLrFU3W6V26zT9JCOpa890FckjHuHrqktJd33bVkNKYfXLRNpBqqTBGNS0gSnh
	 ZH5ctvkaRwikIhv018gQWyGjMAS3ZDdiUSUKdtgOO3tf10RyKwAoRZokveyqlCFcZd
	 dWp+UWlHTQ/bRhSQq2fN+wt+P3DIBx70WA+BU1Q1vSt/Dpm25Y9cpctCrW4tp8kaTX
	 V01QedYjvtX7zy04UdWkt8EwdChUef/4Dgsa1lJPedjRsHWJiNZ9AmibYmT9zxJ9k8
	 t1lbwBf5khySFXKRT1Ib87oZQs2hOmaM6d8YL/O6VclwoONmV5XSg0gqD/9cRZz90R
	 cMGZefUkOUDr0F1Vza5kfMobDfSRhMYoP8rDH6wmmOtzjsuHy5KzLOItqL/YabsXW2
	 UhOt3/Ymgrf7pHYWf8zhgaBUCKRxQkxdRk2BVDIFY0qZf/NEbLI5eEjbkW+BOhUjo3
	 5rb6yK0mnOrrEYfA6H1T4LF3M/a72sZR9PGCEHoI9XfD7CL4WZPxmjF1fnlm192C51
	 SeYp1cAV52jeEaLlzccqeSpGbAmxEaNoXeJvTUofNraSkj5ToTxAnq3J6kPvtBPazE
	 NCpEzCksXU/7+Wkpl/6ZuqgGTetQoLtfNl3ukhGBUPf3v7e+yn2EBTVYfjNu33Z4OX
	 uMIQgMIvxGddGok+ni0cq0Nc=
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2f05b674e3eso16142885ad.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 20:09:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795406975; x=1796011775;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=YLKmTz9mXxZ44RenvTwUZJjRcB/29lTMpfzoB+6Aoqs=;
        b=pjjbZ8NErGJeu+zUBNtvUJFz0ovvdKfEujBaF+U7uHIEaR5RZWcvNa51LUGccKiUj2
         In8TTuL4cscOakCTlyJkrs2A7ZB1DsUnM4XrU8ZDXuh/Ury+4RhLOnk3TBE7UIDMB0ew
         4dEGPegqfPyN0XV3Mc1YhB43pzB451pKA4Bjc9U6lnypzYouTLZ6+kJ7q1nTg5FTOMcb
         gWb37N0UATyCRNW0qXK+trq/4N0PcU8H8VFW928MSsONpmr4nKHwmCNIoLOGtcEc30ee
         dMW+y4J9T2z3EuDI1JXhPR10bNJIAgeTaAJGvCv95qPgV6JRPNiLP6as0bjpKjWusXZY
         1nuA==
X-Forwarded-Encrypted: i=1; AL+hErFBSpEG4VZM/1eXWrcaVmWFCBPDTE06yLEteuCnjX/CeoHhIHFOe6BnsjirWNPCbe9KNaIpNi2sEnl4DeA=@vger.kernel.org
X-Gm-Message-State: APuU4Z87N+c7xoYKODyV8nr3jHh0Z4h6uFHuuq6ixsZIpnNxTjoIpHkw
	9+l3IV020WZff9DWQwht6qYA7a3KJGSrlbhTKU4PNex2kePPZG/UEBOkshkacgdtG4cNgJNHjBb
	OafLRQaZ6AXM3V6iRI/v3w7mJU+XNa+ubFJ7yF3WUc2TsrqrA+InnCBP+iWk5jIY1kS6mGzu/Ms
	rfEeFQYw==
X-Gm-Gg: AZFdTZdlMAep8DeRShZOvHxPtYTXFrA+Hk4cP/19MYtH3DrZb4a/aRYrbd6WEXLVd20
	Fyrc5FOh9JoswFvh5iUEf/Sp46urrpfNHsbTHnGh99VqXPHmYSsCODpE5S/BwuiM6uU2GmJJM4T
	faMDeUmzwyhoEZLFyvq0NvnValjlIbvw7hL/IlLifjRZQdx0rleX7N+uckCyVhniOYoma9t1goR
	9QyVaxXyCV4PFC8wFz0kLJ7kofoYMIEefQH2eKEc4HWPRg91bXO45Dz+6NQLjDJunboxO5mLg3x
	fNcopDX3t1OLMBPrdcq0HHLROLR12B3XQogn+b43my4WL5FBaomq4NXdS9vE/3UIzBCfISrfHki
	E7fTgxYK/NvSUe4iLtdw2v5G5rNZHtzhZ3MG3rPyO4e2iB8tuIpD0WjtN5AgRO+FNGnafBze6pW
	QHtxTgN+rczciyJ69PE/lx/FLDnnWw
X-Received: by 2002:a17:903:2283:b0:2f0:7707:228e with SMTP id d9443c01a7336-2f077072aeamr39456395ad.32.1795406975000;
        Sun, 22 Nov 2026 20:09:35 -0800 (PST)
X-Received: by 2002:a17:903:2283:b0:2f0:7707:228e with SMTP id d9443c01a7336-2f077072aeamr39456135ad.32.1795406974561;
        Sun, 22 Nov 2026 20:09:34 -0800 (PST)
Received: from acelan-Precision-5480 (211-75-139-220.hinet-ip.hinet.net. [211.75.139.220])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f118c88sm45431965ad.56.2026.11.22.20.09.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 20:09:34 -0800 (PST)
Date: Mon, 23 Nov 2026 12:09:27 +0800
From: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>
To: Ye Shu <hello@shuye.dev>
Cc: Tony Nguyen <anthony.l.nguyen@intel.com>, 
	Przemek Kitszel <przemyslaw.kitszel@intel.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Dima Ruinskiy <dima.ruinskiy@intel.com>, Vitaly Lifshits <vitaly.lifshits@intel.com>, 
	intel-wired-lan@lists.osuosl.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] e1000e: add Dell Pro 5 Micro P5M1260 to disable K1 list
Message-ID: <awO7PG_bzIjHuq4O@acelan-Precision-5480>
Mail-Followup-To: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>, 
	Ye Shu <hello@shuye.dev>, Tony Nguyen <anthony.l.nguyen@intel.com>, 
	Przemek Kitszel <przemyslaw.kitszel@intel.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Dima Ruinskiy <dima.ruinskiy@intel.com>, Vitaly Lifshits <vitaly.lifshits@intel.com>, 
	intel-wired-lan@lists.osuosl.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261119001818.513503-1-acelan.kao@canonical.com>
 <c4801ff7-7ff6-457e-b0a5-c2e633d35c59@shuye.dev>
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
In-Reply-To: <c4801ff7-7ff6-457e-b0a5-c2e633d35c59@shuye.dev>

On Thu, Nov 19, 2026 at 05:54:50PM -0800, Ye Shu wrote:
> Hi Chia-Lin and others,
>
> On 11/18/26 4:18 PM, Chia-Lin Kao (AceLan) wrote:
> > K1 was re-enabled on MTL and later platforms by
> > commit 578294b8b60d ("e1000e: Reconfigure PLL clock gate timeout and re-enable K1 on Meteor Lake").
> > Since then, the Dell Pro 5 Micro P5M1260 (Panther Lake, I219
> > [8086:57b3]) no longer enters S0ix during s2idle.
>
> I have independently reproduced a similar S0ix issue on a different
> machine, an HP ZBook 8 G2i 14 (also Panther Lake, with Intel I219 NIC
> [8086:57b3] using the e1000e driver).
Cool, I think you can try submit the patch for your machine.

I also verified on another bunch of machines and found another 25
affected machines.
The impact of enabling K1 is huge, I'm not sure how Intel will handle
this. But for now, there is no harm for sending out the patch.

>
> Machine tested:
> - Model: HP ZBook 8 G2i 14
> - DMI system vendor: HP
> - DMI product name: HP ZBook 8 G2i 14 inch Mobile Workstation PC
> - DMI base board product name: 8ED9
> - NIC: Intel I219-LM [8086:57b3], subsystem Hewlett-Packard Company
>   Device [103c:8ed9], driver e1000e
> - Distribution: Fedora 45
> - Kernel: 7.3.4-300.fc45.x86_64
> - BIOS: Y70 Ver. 01.01.07
>
> With K1 enabled by default (disable-k1: off), S0ix entry is
> intermittent. Some suspend go into S0ix while others do not, even with
> CPU reaching Package C10.
>
> > Every suspend ends with:
> >
> >    intel_pmc_core INT33A1:00: CPU did not enter SLP_S0!!! (S0ix cnt=0)
>
> Failed suspend produces the same message:
>    intel_pmc_core INT33A1:00: CPU did not enter SLP_S0!!!
>
> > The PMC low power mode status dump shows the GbE IP is never power
> > gated (GBE_PGD0_PG_STS, GBE_D3_STS and GBE_VNN_REQ_STS all 0), while
> > the CPU itself reaches C10.
>
> The PMC dump shows the following:
>    CPU_C10_REQ_STS     1
>    GBE_PGD0_PG_STS     0
>    GBE_D3_STS          1
>    GBE_VNN_REQ_STS     0
>
> > Disabling K1 at runtime restores S0ix on the same unit, kernel and
> > BIOS:
> >
> >    # ethtool --set-priv-flags enp0s31f6 disable-k1 on
>
> Disabling K1 using the same command appears to resolve the problem. I
> performed the following A/B/A test within a single boot, using 120
> second rtcwake -m mem cycles and measuring slp_s0_residency_usec before
> and after each cycle:
>
> disable-k1 on:   6/6 successful (~116-119 s in S0ix)
> disable-k1 off:  1/4 successful (118, 0, 0, 0 s in S0ix)
> disable-k1 on:   4/4 successful (~115-119 s in S0ix)
>
> Since this issue also reproduces on a different machine with the same
> PCI device ID for NIC, would you prefer adding another HP-specific DMI
> entry to disable_k1_list, or do you think that disabling K1 for all NICs
> with PCI ID [8086:57b3] would be more appropriate?
>
> I'm happy to submit a separate disable_k1_list patch or test any
> proposed changes.
>
> Thank you!
> Ye
