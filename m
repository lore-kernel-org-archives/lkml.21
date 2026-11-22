Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.97
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795378187;
	b=oynnTJ0zzulLjSLsRFxQ+SzzYc0DU+RNv9WoA38Ul0X5zQJrUCETXHQr4lPpTIRMK08V
	 VFLHUcCLbkoAepBF+5nVuiUNkOZ/c6l7PJAJYuEYMu4SWq3upY8/WjiZ+B/vlarVk1/41
	 id4Uyos2MqRedWeADhPr8SAycbSkXprJWq5Qhbnor/vcuCeordfYW5xYLtyq8iFWOHNM9
	 iYKWKuvyxjDiOU042XVoJ1jUsPXOGcO2tSsikApuRMUy6PRFwPUyE3NPInzP9N9oRaqSI
	 bqNkhacSGE0JFqnzKJ7JH6wAClhjODhlB5vyjuqozUunPG94wskgKaIbWg1TJbnlTVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795378187;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=rcbebePUPzdbCQMCqhzAbHIDU8UxYYQNkrNaGpM3mnE=;
	b=nbb86DWHzPg5CYY3xL8eKhqCYGUKN2HblvwcB9cQiPn77IWGN1CjYqNgOubBvxnJ9SQS
	 uSNfBZ4R+lRJGFGbbIc4NlV2T3aOTo8Bk9sPNyfjkG1UmIJj7qsxRAlFwHyccAdlrikt0
	 XtL/WPnc/j1viOSZd+6M8tmShN5bT4zEspTbiFczagiURFbT6HQr0T4M/0d42yQDsUGwi
	 Ss9ixO+g1kj+iWlx09SdU1EI+Yl8Rpc0aM3NWBwjmsL2xj3e84CRkRrAHsfu9k4/Ktcla
	 sYpbpJaUIYh23ViMWy+wwwcNAKa0fp8d1KYfDEFzcsOQa0EvwD7AxTeMwca1/GHr4Hg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=NEJylvT3;
	arc=none smtp.remote-ip=209.85.216.97
Received: from mail-pj1-f97.google.com (mail-pj1-f97.google.com [209.85.216.97])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C05E9606A32D
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 20:09:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C05E9606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=NEJylvT3
Received: by mail-pj1-f97.google.com with SMTP id 98e67ed59e1d1-3b40d23e1adso1919397a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 12:09:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795378186; x=1795982986;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rcbebePUPzdbCQMCqhzAbHIDU8UxYYQNkrNaGpM3mnE=;
        b=ASAUGDCHOGnh0PqaS3bxkr4KLMwYNSM7SuU7/5ufZ8IzisXVnzQLj9WEYOce3eD1Xs
         9uZHy6t12ONSmMDss/5WFimL3Al9obOxDKDtDaZjsfZZfnAFNXaQ5HljwSHRef4T90Qj
         i4VL3aZlqbP46WMNqcQlJfQyMpW9t3mOx4eM69ryt/xi6KylEuWkz9L1PuJYoHsWlqrI
         WjxFNT+BdcnXbfYzNNYgVcAPJeHbTmAfBPs51qPSXv5DnFU8YnYtJGNPD6LZcct1/z/t
         W0GosSfzPZozr0znPrugIfvtp7DpxhY/bBvhnv48SqWLuGDdexDaUQcZ2pzulng+V2nb
         0BpQ==
X-Forwarded-Encrypted: i=1; AL+hErHvtiSfrOoGx7JPdTDTJpQmB33RTmrox1rwKzLQugQ5tvgUPLnNA+DJ5NHO2D9pSZ4Mhf3hlYdXu55oaQs=@vger.kernel.org
X-Gm-Message-State: APuU4Z/xD1U060rIUarG/ewrPXZXfzqRPPfJ3GKptksjlsB0FzTtjbmH
	zP/y08fwQMJcbr5mTY9VW7qwLiiEE8yqmBCXgRkynRolyA8BD4bo1Oa1FyL0ynkv2d2yBDLjFso
	RwDnBT1+Cnf0Rcs8P+rqJeCvjdPeo/qQlbKUGjb8wFV37kP5trGJfFetLoBr7D3JY86A98fHZFF
	WSo/786a7OOCEyN9IZiYP4xetXG8/iNnGlTTuNjzD/kE8P5fHvcGzt7D5dpcOTOZmBNFf7Mwnad
	Kye6SJEJyIlCqpPaYG4zVA2Sw==
X-Gm-Gg: AZFdTZcXG+tt2JlHvBFTXm8T/Vr1HuRARfEXH/w7HCuLwdGlH994faCVtOSthGxtFZ3
	TgLWnbqnqGPKybaBOdo9r6SCXFgRKe67JTJNT88iiIAkQRQYDqFEDUeFuFyO4JNOHs89ZE+4ubO
	PCxWghqRSMTTSZeI3QcslE0syglAIqljNbBg91S4TP2Ql0Lylau2VShAK+VdANXwHDgnjnCOHFO
	eeqIuOIMHO9zFSc4y5xyNoi8szqNAfTNMxOJBLeGCMMvfWIX+OUfOuWtKyHA3nP3A+MSZ3pQhwv
	QIcxwBwI9N7Qtu9I5xYSz+K3zitoruXA3636BZ7RlmmE7fBdao92TkFxJc8J1/3k8+hEsrWyPLT
	b2oMbSiAF8GUAFK4MsELNi4YZe4s44mP3LA5niwnoI/rRv1fgwYKbFaxGC6Y5YPCUwWe5FZZScb
	jwmhegg3uErjqL/TX/rmx3INzV4OOWPeggLbGIk0M=
X-Received: by 2002:a17:90b:278c:b0:3b1:bdc8:c32b with SMTP id 98e67ed59e1d1-3b41c97ac78mr9604789a91.53.1795378186214;
        Sun, 22 Nov 2026 12:09:46 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b4062eb7cdsm7513586a91.8.2026.11.22.12.09.44
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 22 Nov 2026 12:09:46 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-94967c6d4f4so287899685a.2
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 12:09:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795378183; x=1795982983; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rcbebePUPzdbCQMCqhzAbHIDU8UxYYQNkrNaGpM3mnE=;
        b=NEJylvT3N8KSXAE+XAzeZpyzWfogj8GnKBDa0jgEhuieHDxm/PoUGmqU4KnuV2HjvC
         QkuR2gox14XVXh8VH+1Zhqw+ebhaLMUp7Ayxo/VQVw7U3vICwA5Zed3foNMnIcpP1F6b
         9pdYn+YCW/apVNfGbfcAb+YlK3UQqk4q8gZek=
X-Forwarded-Encrypted: i=1; AL+hErEnS8KeNjdhASPviJif+EKp662zEqDFjPtk20h/JnJNJUryARVUya7EOZTLi6UP3yaeE7TL4O+OZNrT+qA=@vger.kernel.org
X-Received: by 2002:a05:620a:6482:b0:949:35ae:6458 with SMTP id af79cd13be357-949bab0c169mr1703408885a.43.1795378183489;
        Sun, 22 Nov 2026 12:09:43 -0800 (PST)
X-Received: by 2002:a05:620a:6482:b0:949:35ae:6458 with SMTP id af79cd13be357-949bab0c169mr1703404485a.43.1795378183023;
        Sun, 22 Nov 2026 12:09:43 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb34ac11sm664845385a.14.2026.11.22.12.09.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 12:09:42 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Andre Eikmeyer <dev@deq.rocks>
Cc: arend.vanspriel@broadcom.com,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Yossef Osman <Yossef.Osman@proton.me>,
	Aditya Garg <aditya.garg@linux.dev>
Subject: Re: [PATCH 4/7] wifi: brcmfmac: create and remove the AWDL interface
Date: Sun, 22 Nov 2026 21:09:29 +0100
Message-ID: <20261122200931.2090372-4-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261104151547.70333-5-dev@deq.rocks>
References: <20261104151547.70333-5-dev@deq.rocks>
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

On Wed, 4 Nov 2026 16:15:44 +0100, Andre Eikmeyer <dev@deq.rocks> wrote:
> Firmware with AWDL support takes an interface of type AWDL from
> interface_create. The host gives the MAC address, the firmware
> interface index 2 and the AWDL BSSID 00:25:00:ff:94:73. The firmware
> answers with an interface event like for any other interface.
>
> The AWDL interface lives outside cfg80211. Add brcmf_awdl_add() and
> brcmf_awdl_del(), called with RTNL and the wiphy mutex held, which
> create and remove it together with a network device "awdl%d":
>
> - The interface events of the AWDL interface complete a wait in
>   brcmf_awdl_add() and brcmf_awdl_del() instead of going to the
>   cfg80211 handler. A vif_event armed for a P2P or AP interface at the
>   same time stays with that interface. When the firmware removes the
>   AWDL interface on its own, the event worker removes it as before.
> - The network device gets its own net_device_ops with open, stop and
>   start_xmit before it is registered. The firmware filters AWDL traffic
>   itself.
> - brcmf_net_attach() and brcmf_net_detach() also register and
>   unregister a network device outside cfg80211 with RTNL held.
> - brcmf_awdl_add() needs the AWDL feature and a free firmware
>   interface index 2.
> - The AWDL interface uses direct addressing like an AP, every peer
>   gets its own flowrings. brcmf_awdl_del() deletes them before it
>   stops AWDL and removes the interface.
> - The AWDL interface is removed in the cfg80211 suspend callback while
>   the firmware still takes commands.
>
> Tested-by: Yossef Osman <Yossef.Osman@proton.me>
> Tested-by: Aditya Garg <aditya.garg@linux.dev>
> Signed-off-by: Andre Eikmeyer <dev@deq.rocks>
> ---
>  .../broadcom/brcm80211/brcmfmac/Makefile      |   3 +-
>  .../broadcom/brcm80211/brcmfmac/awdl.c        | 268 ++++++++++++++++++
>  .../broadcom/brcm80211/brcmfmac/awdl.h        |  47 +++
>  .../broadcom/brcm80211/brcmfmac/cfg80211.c    |   6 +
>  .../broadcom/brcm80211/brcmfmac/core.c        |  59 +++-
>  .../broadcom/brcm80211/brcmfmac/core.h        |   7 +
>  .../broadcom/brcm80211/brcmfmac/fweh.c        |  17 ++
>  7 files changed, 398 insertions(+), 9 deletions(-)
>  create mode 100644 drivers/net/wireless/broadcom/brcm80211/brcmfmac/awdl.c
>  create mode 100644 drivers/net/wireless/broadcom/brcm80211/brcmfmac/awdl.h

[...]

> @@ -0,0 +1,268 @@
> +/**
> + * brcmf_awdl_add() - create the AWDL interface.
> + *
> + * @drvr: device.
> + * @mac: MAC address of the AWDL interface.
> + * @ndev: set to the network device of the AWDL interface.
> + *
> + * Called with RTNL and the wiphy mutex held. The interface uses the firmware interface index 2
> + * and the AWDL BSSID 00:25:00:ff:94:73, which the host passes to the
> + * firmware. Return: 0 or a negative error code.
> + */
> +int brcmf_awdl_add(struct brcmf_pub *drvr, const u8 *mac,
> +		   struct net_device **ndev)

Return: has to start its own line for kernel-doc. The kdoc check reports
no description for the return value of brcmf_awdl_add().

[...]

> @@ -0,0 +1,268 @@
> +	if (!err)
> +		left = wait_for_completion_timeout(&awdl->if_event,
> +						   BRCMF_AWDL_IF_TIMEOUT);
> +
> +	spin_lock(&awdl->lock);
> +	awdl->adding = false;
> +	ifp = awdl->ifp;
> +	spin_unlock(&awdl->lock);
> +
> +	if (err) {
> +		bphy_err(drvr, "AWDL interface_create failed: %d\n", err);
> +		return err;
> +	}
> +	if (!left || !ifp) {
> +		bphy_err(drvr, "no interface event for the AWDL interface\n");
> +		return -ETIMEDOUT;
> +	}
> +
> +	/* Like an AP, AWDL sends to each peer through its own flowrings */

When the interface event does not arrive within BRCMF_AWDL_IF_TIMEOUT,
brcmf_awdl_add() returns -ETIMEDOUT but the interface stays created in
the firmware. If its event comes in later, adding is cleared so
brcmf_awdl_if_added() does not take it. brcmf_add_if() has stored the
ifp in iflist with interface index 2 by then and nothing removes it.
brcmf_awdl_ifidx_used() makes every following brcmf_awdl_add() fail
with -EBUSY until the device is detached.

On this path send interface_remove, and drop an ifp that shows up
afterwards with brcmf_awdl_drop_if() instead of leaving it in iflist.

[...]

> @@ -0,0 +1,268 @@
> +	}
> +
> +	/* Like an AP, AWDL sends to each peer through its own flowrings */
> +	brcmf_proto_configure_addr_mode(drvr, ifp->ifidx, ADDR_DIRECT);
> +	err = brcmf_net_attach(ifp, true);
> +	if (err) {
> +		spin_lock(&awdl->lock);
> +		awdl->ifp = NULL;
> +		spin_unlock(&awdl->lock);
> +		brcmf_awdl_drop_if(drvr, ifp);
> +		return err;
> +	}
> +	brcmf_dbg(INFO, "%s: AWDL interface, bsscfgidx %d ifidx %d\n",
> +		  ifp->ndev->name, ifp->bsscfgidx, ifp->ifidx);
> +	*ndev = ifp->ndev;
> +	return 0;

The other brcmfmac interfaces get SET_NETDEV_DEV(ndev,
wiphy_dev(cfg->wiphy)) in cfg80211.c. The AWDL net_device has no parent
device, so /sys/class/net/awdl0/device does not exist and the interface
is not tied to the bus device in sysfs. udev and network managers that
match on bus path, driver or parent device do not find it. Add
SET_NETDEV_DEV(ifp->ndev, wiphy_dev(drvr->wiphy)) before
brcmf_net_attach().

[...]

> @@ -642,6 +640,42 @@ static const struct net_device_ops brcmf_netdev_ops_pri = {
>  	.ndo_set_rx_mode = brcmf_netdev_set_multicast_list
>  };
>
> +static int brcmf_awdl_netdev_open(struct net_device *ndev)
> +{
> +	struct brcmf_if *ifp = netdev_priv(ndev);
> +
> +	if (ifp->drvr->bus_if->state != BRCMF_BUS_UP)
> +		return -EAGAIN;
> +
> +	/* The firmware runs AWDL, the link is there while it exists */
> +	netif_carrier_on(ndev);
> +	netif_start_queue(ndev);
> +	return 0;
> +}
> +
> +static int brcmf_awdl_netdev_stop(struct net_device *ndev)
> +{
> +	netif_stop_queue(ndev);
> +	netif_carrier_off(ndev);
> +	return 0;
> +}
> +
> +/*
> + * The AWDL interface gets no multicast list and no MAC address change, the
> + * firmware filters AWDL traffic itself.
> + */
> +static const struct net_device_ops brcmf_netdev_ops_awdl = {
> +	.ndo_open = brcmf_awdl_netdev_open,
> +	.ndo_stop = brcmf_awdl_netdev_stop,
> +	.ndo_start_xmit = brcmf_netdev_start_xmit,
> +};
> +
> +static bool brcmf_netdev_is_brcmf(struct net_device *ndev)
> +{
> +	return ndev->netdev_ops == &brcmf_netdev_ops_pri ||
> +	       ndev->netdev_ops == &brcmf_netdev_ops_awdl;
> +}
> +
>  int brcmf_net_attach(struct brcmf_if *ifp, bool locked)
>  {
>  	struct brcmf_pub *drvr = ifp->drvr;

brcmf_inetaddr_changed() finds the interface by its net_device, so an
IPv4 address on the AWDL interface reaches the ARP offload code. With
arp_version 1 that code uses the primary interface and adds the AWDL
address to its arp_hostip table, so the firmware answers ARP for the
AWDL address on the station interface. Skip ifp->awdl in
brcmf_inetaddr_changed().

It looks like this is the/another reason for the arpoe/ndoe patch [1]
sent. At least for the ARP disabling part.

Regards,
Arend

[1] https://patchwork.kernel.org/project/linux-wireless/patch/20261118123933.74517-1-dev@deq.rocks/
