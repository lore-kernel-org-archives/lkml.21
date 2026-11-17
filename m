Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794958273;
	b=3dh0TqW0rV2hz9yCnRPKG2bOxBZ0prl4FuTh9S0Xs6P1pHBdUICaMk+09q3Frj16Y/kb
	 5Sf1U0Emf/Zuir2IHsXA2qbeNzf6aHTl92j9P//upKWbmopvkcaPuMp/gwKuYbSYVzFiT
	 YbNSn19BioKIXPv5E+BayHUgj5Kc+tMdgBe9HgxYMo6/SZVeTEu2mGfuuwNAO23uqPxiA
	 jYsCXq3p+dNwChNKp3nlRINcAaEiTJkpkUNGGcA+7ZO3NYDhuJhq4ohnQoHkPIu1Kdg4u
	 DbDy+TqmOYdTyl9bNpUu8HgtOsYnpIB5ks0iYJEtwkzrArPAsApQYTVKsgiW4qkUhXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794958273;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=U+gaTE2rxn1GavMY3VnMCM5lJuO+puyH/nRlKYyd314=;
	b=lbp4ZgJEvAnN7p9ZTwjd5067f0jbhbRAfpRdWQS9B1Ap/DplBBYB01Fliwi6Iui7uxAr
	 J/8cGLuKjotcoPed3+g3ZPh2UXcTqBrNh/BvNX63q8w4ZGGS9/7tSyY68Zbc5O1m1VBlx
	 EB5coqR+IYUHihm3NXCCVuM6WtrFRKxmsSZvZwx0OqBDk5iotM3o4m/wxetVUrog1eZ7X
	 shXI4acwx85ryoxRFhrfONNbAxUySJM23ep7XxXkF6Y4fI2d2JbVrOewvor5ZTSHRJTnq
	 uXn21xnpUKRjGUAXfzDOLQ4+oMdanyHGP6YaPkfJrAmMOTROgkJFaPKTHk2CjXz1AmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=V6jBQUi3;
	arc=none smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32996606A32A
	for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 23:31:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32996606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=V6jBQUi3
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2ee254f6eefso28685ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Nov 2026 15:31:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794958272; x=1795563072; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=U+gaTE2rxn1GavMY3VnMCM5lJuO+puyH/nRlKYyd314=;
        b=V6jBQUi3q6m1fugKTg8i7lQ8YDvbRwD84RiZEIDWlYbSi4jmx0O8pDk4TcWjUIoq2Z
         gSlmayGUYvbM38basu2SKO51QKrDucxN/t9XcIBZVCnrubwuwJMauuOP8Mb9HOTMtvyJ
         LXgTh/Z1zeODT20b0JPvKIWGItpbuT3dcTIFML5bwiUjxAE0ThCDfG72VkGLc5mdKA9n
         kXUzRcqWRx2W66sm+0xf0rpa0PCEUmT6iLs6R5AYw/3GnzlZHsUdBbBFXkhe7y9bECxf
         Rz1bS8cDPMArbZZ9L11+LBukFRCW3fGEehtJQLVAfF7FWZHWpRSx3RiaBHZcMMkYoeUJ
         KeTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794958272; x=1795563072;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U+gaTE2rxn1GavMY3VnMCM5lJuO+puyH/nRlKYyd314=;
        b=Wo4lbH+TkUyG2j56786cVYqBzgzuHPr47nLFECDijgmsVsLny7ZwZDPYjnOArLk+D6
         I1MwYL1OsdOX9myjpTr1kf6tzjwlXMUdx3WWmZkZFboOP4dHAwZXXcxmeO6POAWlxADD
         fIm8oTlYQPBhphO+3J+TfGsB2Ls0EuZJDISre/w7YXPBGXtnVvhiSMe10gHGxRmtDjEL
         ZI/L2zUkAnF0eY1z/nvq/713qOujbFHnQUS2Fe181UzFWSl/61wkOsGeRMkr7QEg73Gg
         v+BQa0PJpBW7D0n58NtycQe9nAf9mCc+Er1ABP0Tfrl1jKfz0N8pTPgZnjxEAqKgxjXk
         KKbQ==
X-Forwarded-Encrypted: i=1; AL+hErGgP7AuhyJMBnnpCucHGHpNrDRHpadGQowpyXXWib7S9zWrSgno4TA638Nuzz+dH4lG+WU+WE3hkd0Aq0k=@vger.kernel.org
X-Gm-Message-State: APuU4Z/2tMSurt/l5GPTDbhafLy1tbaT0gm+CVunb7MACFv3OUYQRy45
	sUKhOshey81jqktmHaA2oqjDi1rA5zQOE9xxWkyzkHVUOQg/e144skRXIFDjsm24Hw==
X-Gm-Gg: AZFdTZcnCNeavfd8DFzwS3HI5ExyJnq/aRzkHHLPTQOx3ABdpiPBIBY+MYS4Def0uZf
	7zrHTeTJLPL00/+zGp0FrFkgGtnP62gJgct24yCF9XjEidr/OESWm3e3B+TcS+uoQCmUAWFP/Aa
	g8T8qIh/aP6bH4WxJs24GwBgJUl7d6FwGvuvu8QmTSG1tD+TRYa5f2g09Udmc148PUpsmfKzZ8J
	8ypCYKxQJVZtN6iA5VD/+iMsKmXwMDXGVBvbdiImqPvstI2TPed5w+Gx6EibeWs09uXc8svC8L3
	UuF2jEKCdYYkJqROXjHFSTLC/aRVm/ZSIOgb780zZeDkAWo1Plcv0RUpzIepaqWL4Mc7YPaWu7i
	x4GuzXL6dnsP4bznU7xCCq7n1NpzNQw1JFWK8uBwy581Yh84D697zvYUYesK3lgww6x38ZzrMKv
	0biRiSCUtm97mi/GiiBc64AyyrGtUCmErGTFwVXbMbNm5chfjPSembTXGaaPaJ20Y3/qpbiesDN
	CLoX5HUxANjht8xmsriHVURWzn1iuxb8d9tbFIo2J9KqVkg4qCyWHJDefjmPGPuOorHIvW8LHap
	3EDizPeA/VsTqye4KTAUyH1W3CNmlZ4sVti2hlIQK03roq7+XqKjGwHpq+86Cu9dKXrbLpgm52e
	09YbQy0pv0yj/uJ0nar1edA==
X-Received: by 2002:a17:903:2cf:b0:2ef:d87f:8a20 with SMTP id d9443c01a7336-2eff9910e43mr1188255ad.12.1794958271877;
        Tue, 17 Nov 2026 15:31:11 -0800 (PST)
Received: from google.com (25.75.145.34.bc.googleusercontent.com. [34.145.75.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff5ed0998sm3827275ad.4.2026.11.17.15.31.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 15:31:10 -0800 (PST)
Date: Tue, 17 Nov 2026 23:31:08 +0000
From: Samiullah Khawaja <skhawaja@google.com>
To: Vipin Sharma <vipinsh@google.com>
Cc: Alex Williamson <alex.williamson@nvidia.com>, 
	kvm <kvm@vger.kernel.org>, Alex Williamson <alex@shazbot.org>, 
	Jason Gunthorpe <jgg@ziepe.ca>, Bjorn Helgaas <bhelgaas@google.com>, 
	Kevin Tian <kevin.tian@intel.com>, linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-pci <linux-pci@vger.kernel.org>, praan@google.com
Subject: Re: [RFC PATCH 0/5] PCI/vfio-pci: Guard resets against active SR-IOV
 VFs
Message-ID: <avzfBjBZiOnJUH4W@google.com>
References: <20260812045325.2733631-1-alex.williamson@nvidia.com>
 <an0BOyexLcOjFJw9@google.com>
 <20261117225559.GB2250529.vipinsh@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20261117225559.GB2250529.vipinsh@google.com>

On Tue, Nov 17, 2026 at 03:02:00PM -0800, Vipin Sharma wrote:
>On Thu, Aug 13, 2026 at 10:30:45PM +0000, Samiullah Khawaja wrote:
>> On Tue, Aug 11, 2026 at 10:53:18PM -0600, Alex Williamson wrote:
>> > It's recently been found[1] that vfio-pci doesn't restrict resets on PFs
>> > while SR-IOV is enabled.  This can not only result in an uncoordinated
>> > disruption of the use of the associated VFs, but the ongoing use of and
>> > access to the VF has the potential to result in machine checks.
>> >
>> > This series proposes that this gap is largely an oversight of
>> > pci_reset_function() to recognize that a PF reset affecting SR-IOV VFs
>> > violates the scope boundary of the pci_reset_function() API.
>>
>> Hi Alex,
>>
>> Thanks for sending out the RFC to fix this issue. I cherry-picked it
>> into my environment to verify that whether it fixes the issue I was
>> experiencing and it does fix it. I will continue to do more testing, but
>> when you send this as a formal v1, you can add:
>>
>> Tested-by: Samiullah Khawaja <skhawaja@google.com>
>> Reported-by: Samiullah Khawaja <skhawaja@google.com>
>>
>
>Hi Alex,
>
>Is this series still on your radar for formal v1?
>
>If this is the direction we are going in I can use it for liveupdate work
>  https://lore.kernel.org/all/auzftbPFO_6XBYVw%40google.com/
>
>Thanks
>Vipin

Hi Vipin,

Alex asked me whether I or someone on our team could pick up this
series. Pranjal is working on it and will send out a new version. There
is some extra work needed on the IOMMU side to make sure that the device
is moved to a blocking domain when the reset is skipped.

But I think the patch you need is fairly independent and can be sent out
separately from this series:
https://lore.kernel.org/kvm/20260812045325.2733631-6-alex.williamson@nvidia.com/

Thanks,
Sami
