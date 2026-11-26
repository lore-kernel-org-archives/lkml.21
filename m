Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795709703;
	b=Xqug00RCzGABbg5/ZDHm6K8kDSwHEBtMwn9nIESa5wnbaxjzkRCZrLtGo7ORkppu2Qld
	 3plTBOLzFeSfK1M2qfD4w2LJoB7OS5PpMxb2KyzocHdlEadEIfscUMe0qCDOdjGYZZ02w
	 WFZHY9FbacYxASS1hYXpOXRp1cIz8vqgYrrHkfXrRVpLYfJYLdgJgtdrO0DlFkaxNo1SJ
	 zCnmPN+EcdUxs4vx5aP7PgpUzcdtMJfG5QMLOi4Ibhh4eITehWz37FZxs+QLvkZ5qzH5P
	 TQs8hJe5bxhkLLJUr8BljBzMu2RtwwFsEIPICqLRFA6GUbRgs5G7mDsj5r7UbB52IFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795709703;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=N7eaA+pAnwf/IqHnAWMBkaURdmeG2S8bgeOrBt9N6m4=;
	b=2cbVEW5s6PXvBXqsG31F+j/gAOtREMu+LgTilT5XdhVFy0BJvTzix1Uj6OE2E5h1dLQy
	 F7FEAVYLMsm1zFqoIzWXjpn4VM43PAID8rqmJNcrzhFdb1Iz/ND4D3RdCxYIB788eVbLW
	 BhUwa5YEyVQBCM/AU79LxrQdnywPlFfrQ0Pc75O5aV4m0d0/CM1iXPNSmEW5LSeqMloJD
	 6EVU2squrzYIqB5SAgP6Pws/JbP5oqCDQAwuNroeFdIGIh+LhCkVkX3O/5mkw+NZDNO3R
	 J8CoRx5mLXgPRt2cusGil1i0rcibrZTOrNH7z/35PpIlIhkfmONqXvnWqJY/OFF+pRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=GbtOW6Sa;
	arc=none smtp.remote-ip=209.85.217.100
Received: from mail-vs1-f100.google.com (mail-vs1-f100.google.com [209.85.217.100])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2D7B606A690
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 16:15:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2D7B606A690
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=GbtOW6Sa
Received: by mail-vs1-f100.google.com with SMTP id ada2fe7eead31-7d2dc1ac787so2286042137.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 08:15:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795709701; x=1796314501;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N7eaA+pAnwf/IqHnAWMBkaURdmeG2S8bgeOrBt9N6m4=;
        b=TvJ4lBwUcF0o5GzRdAbU3Z3hoqVzJwU9pPqpX6BwORnd1bAXxeHF4/QeMsiJCQh6gu
         56495wJZSghv9MvqVuo1N0ncqrCoXZjhZH3v8scBVfvr/9Fs8F51iRz1y05rRMEb/Wr6
         dIvrryXeX/t/idSKXoJFap6Yfu9AGp10B9xkPXJ38NB8u5dvjVPUeB06dNDO/ulvZJJK
         hrhBl2hCIU6hkhqh+u9gXa8q0AX50S1uszzFMcuc4NXi81AEj4YhbrBOcbumCjOjD0YM
         ojt7inSg4mft5zwWhNf/xCejX+zlKecvCtHwKijTXZxngaPKi6iiMYtZ+d5W+iQVgFgg
         PL0w==
X-Forwarded-Encrypted: i=1; AL+hErEbMVy0CqiP2nCrF3nd+BCG2wZHKXT6qa0bt68ojO4deOcbVdc9MvTpWdVOABnTJxjPh33AKGTfT+BXjFc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8n5sfTjm0caxFLVp0X6zHhq60XSQ739KSziPoJbrcpch4f1D1l
	+NmIsf955YTtZD5IPvx3y1OnjP+qOPF+VPZfNk1cyRo2/2P0QcXjRbm38FUV7toSLpRnwu8KuR1
	7xlwJO65P3CqiIgo9ULWScQPsRHEZJG7Upwut9/H7KiF9Vf6kQvah5EPTZ5A6XAEhDrZNohpQx5
	UYRKPY556Ilj1iqtb/9cLPm6PN4soP6PTto6UbQJ2tR8INx8RqQNaPD5ZHCpnfiubjfY/D228+3
	Xvqyni43DpghbNDtxKbFXB99A==
X-Gm-Gg: AZFdTZeph2FaqwOn8FCsIvEoESfqPT3UUNl1DMJbhz0wuFVyk8PQZV2+JYqvuRtV+Oj
	JaisBgiEKLDNdPxNwX2ceeql08WkzEQ6swyVqYF9SzDVdxPBVG4kgw5IPEt9ZeglF9KIMPdQGtS
	3SN1tVF8GsjmAXFGAOiHOqusQyQzrC15mn4KvTUCfTw1AfuhN5kgbKK86QxHMOp8HN5MmdijqWu
	N/nG5d7/nUkHGqQApbkwpZxDuZWaYxfvI7KLmY6Ni1LYJUeLa39BHvxGFZgeXdBH98NKfXpcJWj
	2xCLtwa12U8Uou2zlroR0NRzlFsCNlQN2Y2Dj8UrqZGoCSdRI25zv0Dhme48RQI4KHHFDniJIM1
	aAYzPXi1W7aLWzTfEjaLjOgWLK0zCP97ozXCY+5JMvwyVj8rmd5CUsbpi5ar/sDkdTRoc7vUAk4
	u46j5uN5IgrUM2TbTjrUj+I4qeN89/LsJtu8cRJcse4w==
X-Received: by 2002:a05:6102:6e88:b0:7cc:2152:4f72 with SMTP id ada2fe7eead31-7d72b361a7fmr9735537137.1.1795709700535;
        Thu, 26 Nov 2026 08:15:00 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-100.dlp.protect.broadcom.com. [144.49.247.100])
        by smtp-relay.gmail.com with ESMTPS id a1e0cc1a2514c-99e6e1b3904sm2140103241.19.2026.11.26.08.15.00
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 26 Nov 2026 08:15:00 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-949b0d322fcso1196194285a.2
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 08:15:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795709700; x=1796314500; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N7eaA+pAnwf/IqHnAWMBkaURdmeG2S8bgeOrBt9N6m4=;
        b=GbtOW6Savwp3cwwmUI9xT4ybqKHdw0xxHBTN13THom7GUVdjaMyDcAIai7bKyWYO8M
         PI985WronS0+aAx5/6hCFPOtsl+EhP4cF7uzUjQsHQm0m4YyiRWSj+heZPP3WEZKkrAB
         1zaVNb8YdTrUbD6j8dG1DCyk0aa+ey9WcYXO4=
X-Forwarded-Encrypted: i=1; AL+hErENzD54e2niShv7JwAQPrFnySfAJzsYW9WaZ01AcQ5KvqEIOuTrZ9G5OnRKWiTw3xmOLoiz8RY/UohrfnA=@vger.kernel.org
X-Received: by 2002:a05:620a:28c8:b0:949:7acc:1695 with SMTP id af79cd13be357-949ba6c5900mr3583054285a.0.1795709699853;
        Thu, 26 Nov 2026 08:14:59 -0800 (PST)
X-Received: by 2002:a05:620a:28c8:b0:949:7acc:1695 with SMTP id af79cd13be357-949ba6c5900mr3583049185a.0.1795709699285;
        Thu, 26 Nov 2026 08:14:59 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949ca6a0693sm1377617285a.20.2026.11.26.08.14.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 08:14:58 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Andre Eikmeyer <dev@deq.rocks>
Cc: arend.vanspriel@broadcom.com,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Sasha Finkelstein <k@chaosmail.tech>,
	Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>,
	Aditya Garg <aditya.garg@linux.dev>,
	Yossef Osman <Yossef.Osman@proton.me>
Subject: Re: [PATCH wireless-next v2 5/6] wifi: brcmfmac: add vendor commands for AWDL
Date: Thu, 26 Nov 2026 17:14:44 +0100
Message-ID: <20261126161444.2484980-6-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261125190254.176055-6-dev@deq.rocks>
References: <20261125190254.176055-6-dev@deq.rocks>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On Wed, 25 Nov 2026 20:02:53 +0100, Andre Eikmeyer <dev@deq.rocks> wrote:
> AWDL election, peer discovery and services run in user space, the
> firmware carries the AWDL frames and data. Add vendor commands of the
> Broadcom OUI on the primary interface, described in vendor.h:

[...]

> Tested-by: Yossef Osman <Yossef.Osman@proton.me>
> Tested-by: Aditya Garg <aditya.garg@linux.dev>
> Signed-off-by: Andre Eikmeyer <dev@deq.rocks>
> ---
>  .../broadcom/brcm80211/brcmfmac/awdl.c        | 644 +++++++++++++++++-
>  .../broadcom/brcm80211/brcmfmac/awdl.h        |  53 ++
>  .../broadcom/brcm80211/brcmfmac/cfg80211.c    |   5 +-
>  .../broadcom/brcm80211/brcmfmac/feature.c     |   6 +
>  .../broadcom/brcm80211/brcmfmac/feature.h     |   5 +-
>  .../broadcom/brcm80211/brcmfmac/vendor.c      |  82 +++
>  .../broadcom/brcm80211/brcmfmac/vendor.h      |  92 +++
>  7 files changed, 881 insertions(+), 6 deletions(-)

[...]

> @@ -116,9 +238,12 @@ bool brcmf_awdl_if_removed(struct brcmf_pub *drvr, struct brcmf_if *ifp)
>  			awdl->ifp = NULL;
>  	}
>  	spin_unlock(&awdl->lock);
> -	if (!requested)
> +	if (!requested) {
>  		brcmf_proto_configure_addr_mode(drvr, ifp->ifidx,
>  						ADDR_INDIRECT);
> +		brcmf_awdl_send_result(drvr, BRCMF_VNDR_EVTS_AWDL_STOPPED,
> +				       -ENOLINK, NULL);
> +	}
>  	return requested;
>  }

brcmf_awdl_if_removed() clears awdl->ifp in the firmware event worker
without the wiphy mutex, and brcmf_fweh_handle_if_event() then
unregisters the net_device and frees the ifp from there too. awdl.h
says changes of @ifp hold RTNL and the wiphy mutex. The vendor commands
(wiphy mutex only) and aftx_work/settle_work check awdl->ifp and then
use it several times, so a firmware initiated removal in between gives a
NULL pointer or a freed ifp in brcmf_fil_iovar_data_set().

AWDL_STOPPED is also sent before the interface is gone on the host, so
a START sent in reaction to it can still fail with -EBUSY from
brcmf_awdl_ifidx_used().

Handing the unsolicited removal over to a work item that runs with RTNL
and the wiphy mutex, and sends AWDL_STOPPED when it is done, would fix
both. The event worker itself cannot take the locks because
brcmf_awdl_add() and brcmf_awdl_del() wait for its events with them held.

[...]

> +/*
> + * Removes the AWDL interface before system sleep, with RTNL and the wiphy
> + * mutex held, while the firmware still takes commands. A queued operation is
> + * dropped.
> + */
> +void brcmf_awdl_suspend(struct brcmf_pub *drvr)
> +{
> +	struct brcmf_awdl *awdl = &drvr->awdl;
> +	int err;
> +
> +	spin_lock(&awdl->lock);
> +	awdl->op = BRCMF_AWDL_OP_NONE;
> +	spin_unlock(&awdl->lock);
> +	if (!awdl->ifp)
> +		return;
> +	err = brcmf_awdl_del(drvr);
> +	brcmf_awdl_send_result(drvr, BRCMF_VNDR_EVTS_AWDL_STOPPED, err, NULL);
> +}

A queued AWDL_START is dropped here without an AWDL_STARTED event, user
space waits for an answer that never comes. Answer a dropped START with
AWDL_STARTED and an error (e.g. -ECANCELED).

[...]

> + * @BRCMF_VNDR_CMDS_AWDL_SET_SYNC: synchronize to the master of
> + *	%BRCMF_AWDL_ATTR_MASTER, %BRCMF_AWDL_ATTR_MASTER_METRIC and
> + *	%BRCMF_AWDL_ATTR_MASTER_DISTANCE. Without %BRCMF_AWDL_ATTR_MASTER the
> + *	device is its own master.

The commit message says awdl_opmode fails while the firmware does not
know a new master yet, and SET_SYNC returns the first error of the
refresh. So user space gets an error on a normal master change and only
the next SET_FRAMES or SET_SYNC sends awdl_opmode again. As this is ABI
it better be documented here, or do not return that error.

[...]

Regards,
Arend
