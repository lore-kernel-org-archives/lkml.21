Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795604744;
	b=XCY31IXZWkAk9Ri5o5jxv25brQaCa9tJ7kxmfExUoNYtfQ9I3zWQo8F0gaNjj2JQvAXt
	 W72Rjkm30XY+6wAfBg3lCrIxBHooGQ0OwrD+vDmyeRVjFyc6AP+RAaasbKSD8OCI+G66p
	 9B0DpYKNFAVbkW6Wl7e1dcSolAM6nJbPGjmx2ioCq7iKcmwfdtXbDcVE7hjEaWnI8jvkP
	 MfueGFZYoR13CnffsJaZ91k0RxxtoHthuEIN5lignKr7HeneP3ncdS8KrL4D7zhBxPBb1
	 PlottB4Z42bCPkOB3whVJ6XYm+nq0X+jOUabZ5MwOMshtk4jWkhXo6qoe8E8G7xTSxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795604744;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=h46JfrdBgUALfGNgCjBaPmKw5l4xKTUQWTAKnBkGDa4=;
	b=WKx+KV+vkFqDikcLALtdH0/myXyOFwjVKmfPtVGEfYdBv8W9qePN/eGnCaGWx0ydeVb9
	 Wt3x91mwAnQ1HzQjFav2aJpipiotqM6qiJ7PDHkCP4k3LxB1co1FZ7K2RJ5A2syUoajfJ
	 6Iu1wmR5S38YORyOsJ59eatTkh4gx83b3EAkSNIl1tQLzn/qardXduUi/DIeHQDvooJei
	 maZTLWNUzBBre39alBABYpiz/RDN9DRObDxl4JJRNVUA6Z/N6WtZbZpcKUESdFTI/76Tn
	 fece84xFwkmzkUgIwhTLeaNGP5p/CIIlrnKe0yM5PD5MkIA4D9fvxt5GjzmkaYTR/eQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Hnjpkmn3;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8038F606A31E
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 11:05:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8038F606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Hnjpkmn3
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4b467581b98so54461375e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 03:05:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795604743; x=1796209543; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=h46JfrdBgUALfGNgCjBaPmKw5l4xKTUQWTAKnBkGDa4=;
        b=Hnjpkmn3YkogUWWGubPCnak+axyl78vFI1wvnAaWisi5Ix2aGdEhqKqoNLZjxsHR8m
         3a2UEHA3l7AWc1toBEkONDWy8PBPy4Zt/W68fVAVx2LVxeraQOUyleZlg19CH8XvPRj+
         Us4J+StxEckxbDln3J0SdNINzAnvMIHHi2rcW27XGBIUSQrwhAA0kNDMZHB31uTxrm7o
         X/4RIHiMzJlQBNl8n8UDc6LMrPYSwBbq4K/N1/+kYgtyZKtPEIzfrLQz/ONFpeQgrSQv
         wvQgXNqNUIs1tDU0BOlelDsOqliyc0RBHfe9slBD5E9SfesfJ/1rGnrD5vUb4FqeHDJI
         kXjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795604743; x=1796209543;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h46JfrdBgUALfGNgCjBaPmKw5l4xKTUQWTAKnBkGDa4=;
        b=EuM8Xccqj40zuLtO56Xgsl0g1KdFlBzRlOKGgzIFblgHN5l4v0pNpTzZcwAMfGF9eZ
         TIZeNp8px/Wz6STZ/52BINSU/ZZETVTftbrwF4d15EstGnDxgOSlxrxzpXL0SOPmysRC
         Vqg96XExuiGCRet/qR/TZzLpchO+mqRBsS1tKEI/ss2QZIXUlOqgFkv7tTzh8m/q7NPW
         ik6XrjcjcRkF2fsNfL950BwZoIavZV7A6AQf4+ghmg4Ly5dBcFcajIJCe+gHGwcmMSlu
         w+y+qVIYt47EFya1YVaz820LjuV8IYhxBBHE3ys4kQM0n2mOIjn8QUBBHwFd1woBQP8p
         wWnQ==
X-Forwarded-Encrypted: i=1; AL+hErGEZ6i/V8yMB2CjChJAPC5rgv90+HJSNLUEw/aB04LPwxh6XqRlahXhH4Z76+DQr7QY90WOCC8i/1GV5Ko=@vger.kernel.org
X-Gm-Message-State: APuU4Z/bMiLTz27AYZZ2rb/w5NXMjWzna2ivsJdpQnKBZ5FbTS5QeDIz
	vGgUIIR38Mwd5lutEyKmMnXt2p6vAeXoLYrW+aXLSeOtLBbLCNouZwYb
X-Gm-Gg: AZFdTZe5oNMUe2SWKKODsc7WkJXqZvjIGPL/KDK0F8vF768+cfcNbdbVRGf9WOfScfz
	NcDKQN5X6/UsRSZOaPZUWfCH6ucJBmYdQnZvSMUyIbHlbGnqIPMhNf4t6Jml7swD8gM92Ie83CB
	HUV8rpPArv2+I82MEuIsC3MiyUegpSIZkaTux4iRyePVryeDlKtENM5zXaM7rqO+hoRHWoQI9O+
	d1+opBXaSV0JMYKC/I9A92jBs3d397EHNgTgX/IJFfgTHldtxYMr6tgV3rwE3eenF6I3o4WPoiI
	jYYxjvyi9dEinMW9QKyLldRvNAi84fBrYsS9yRXwPy8w9R1CsQ6okisJvXqrTeWbWT58qf+VXDL
	X1efN9fGzuoo3hGAfUwzV2vNXWaMrEtKDxgVW5FcQrs35VhmWi8jV1bxLzcolgvGpqi4HTYLRp5
	MKHH4uQdwarhLcOIrsHrvS9xnIdIGghlwoLkGtTY6/ObPAGxKgWvKB2WyOudrBQfLGmszHncBhc
	s1YHJxZCoeh260slotFGS/0CnnK+ViZw630E41MOBSyygiW8XInkSvI7kBQobtB+BpBxh7HYIho
	HIkYhGqUQO65jEVw0TWgctBvu9dNlHkca4Yo9UuKZA==
X-Received: by 2002:a05:600c:848d:b0:4bb:52d8:73ef with SMTP id 5b1f17b1804b1-4bb88940f1bmr350139265e9.34.1795604742721;
        Wed, 25 Nov 2026 03:05:42 -0800 (PST)
Received: from foxbook (bfh118.neoplus.adsl.tpnet.pl. [83.28.45.118])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906635c7sm303198625e9.2.2026.11.25.03.05.41
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 25 Nov 2026 03:05:42 -0800 (PST)
Date: Wed, 25 Nov 2026 12:05:45 +0100
From: Michal Pecio <michal.pecio@gmail.com>
To: Kuangyi Chiang <ki.chiang65@gmail.com>
Cc: mathias.nyman@intel.com, gregkh@linuxfoundation.org,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND] xhci: Handle missing USB2 resume events on Etron
 hosts
Message-ID: <20261125120545.76f07ed8.michal.pecio@gmail.com>
In-Reply-To: <CAHN5xi2dFo2NFbMb8t_5uugX56Fq2=Jj3G2_5xA0-b_NTjQsSg@mail.gmail.com>
References: <20261123072320.5967-1-ki.chiang65@gmail.com>
	<20261123122343.6d3f8866.michal.pecio@gmail.com>
	<CAHN5xi2dFo2NFbMb8t_5uugX56Fq2=Jj3G2_5xA0-b_NTjQsSg@mail.gmail.com>
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

On Wed, 25 Nov 2026 09:33:38 +0800, Kuangyi Chiang wrote:
> I tested again on an EJ188 with three USB2 hubs connected, without the
> proposed fix but with extra local debug messages to detect ports that
> are in the resume state without a Port Status Change Event.
> 
> When I connected the first mouse to hub 3, I saw the same behavior as
> in your test: the USB core checked all root hub ports, and all three
> hubs completed resume (evt 000e).
> 
> However, when I connected a second mouse to hub 2, the root hub was
> already active. Port 1 also entered the resume state without an event,
> but only port 2 was reported in the status bitmap (evt 0004).

OK, so I'm not sure how you reproduced this problem on the two-port
chip, and commit message was wrong - the root hub must be awake.

But now, if I disable root hub autosuspend (echo on > power/control),
connect two devices which use autosuspend and remote wake one device,
the RH wakes both ports and only generates one Port Status Change. It
seems nobody expects the other port to be affected so it stays stuck
in the Resume state (SW is responsible for transition to U0).

I don't see similar behavior in other xHCI root hubs, nor in a few
external hubs. Anyone knows if this violates the USB2 spec?

Regards,
Michal
