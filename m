Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795378189;
	b=eVJm11vAWxpKiS6tJTsBTWn/4GSbddOfC/gEyTlp2SjEeiDS+KcNsHmhzUThWfuG8uaX
	 8hnGRYx6XnIss1BzR+Uw3akXcVMMkL3H2/YpAGSRYtEXxtGo9RbErvQmrWcoRGRh+0UGd
	 fC11vdhpKL6hgjJlH8YyZD/zzEZlBQUwGFNMSbG9kqll5ol5TSg8RoY+4Q3ZBYpesGFbz
	 DLv2eIM7ex6SZ/csBfLSH6pDagOPUE4PiYy5IlH+/c1SQ++4OBjHl5oWC8saHMV2k+fem
	 oWuSGQH5r/5JQkt2UD/hv70GrqTB+k/PitH8bprKnGjAcshO/EGNjDPQXEHHwHciqdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795378189;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=kTiDmMcQejKcdkn+MG3mE/4LRNga/Ihe5FTdQb6iz0E=;
	b=NKhsb9x4Pf9qrudESAQLj6zbnE5mXK9ZfdwzkICanNlXJImt8oE5Xz/4LOp5YxK2QP13
	 mXmiVpCamkdna81Gq6aBxc3Jf9gXCmMXrdN6TmYccuUaHizJnKBvciMmWIY2bJFWUd/9a
	 3Vnlk5c5vheVkCQEMnfiDUkV3SR0kOwfVlboAvb3JowK//Xs95jNj/m+KEeVroiQBXCpp
	 UIGxFuFbcuOFsbspt40kB9J5+4CKeVfYmnyDpseAhv+/eRVcUvREvrmbfAn+vgJI7zAhk
	 e3BTp/hWORP52XUMamfU8fzRSQ9mr8sPrHXTWcByQHst/LYp1Sz+yOMF9si/ch8RJYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=PBVZvW+J;
	arc=none smtp.remote-ip=209.85.216.99
Received: from mail-pj1-f99.google.com (mail-pj1-f99.google.com [209.85.216.99])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74F07606A685
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 20:09:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74F07606A685
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=PBVZvW+J
Received: by mail-pj1-f99.google.com with SMTP id 98e67ed59e1d1-3ae6b4c669fso2908834a91.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 12:09:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795378189; x=1795982989;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kTiDmMcQejKcdkn+MG3mE/4LRNga/Ihe5FTdQb6iz0E=;
        b=qJqtm0BLv6y3Bq4xtXuAXgffa/1suqeWXQwWCgcEc1AHbAexbEpC7MDLBbzC73TXVg
         dOIfgk7wAjifZLuI+iCg0LlZOZZed5dGwSzr0dJeKemkK6FV3/Ve31A9acv3+h+sws2S
         8NwCBwF0+GqGxmPP83IPbO6Ejs8TnHOfKZL/kqCIZXX3RX5WXLTQo7dK/4wSJCtz2rCA
         uX2zhlq6HhzgpfJCwP7Ss4Cuq+nZzxpvbFVg+99Y0KY9ranka/iw4mLbV4+ZO2T3d8BW
         A7RS0Ub/iF42a4t8pLH5FNDXf+3eEwY4lnPrNG+UJVVY6vKK2hd4pmdRqOzhuK6iXNBu
         ZFNA==
X-Forwarded-Encrypted: i=1; AL+hErG6S+a4dLfFToOVvg+GdF+8A2lEtcg6VNWQa0iNERMEsQp2a3PNwfLXXcB6Cfk3i1oYyeFFrRmeocXhJLc=@vger.kernel.org
X-Gm-Message-State: APuU4Z/I71BroojrruKQ+IfFHvFOJiG8XfVTJzv45KIcjvdVJWBuFMUA
	6veVhhXOL9gt3kaCht4IxwqNY31bl65WW0Sd8MC25gDyLX5BW7HuO5p25etOy6V8jcPAecFIBpH
	Psf+KPveeK1D90gOABTkYpMBqWJU3fbgddSmsStbRW34IpDJpdDL36EOfA38d6AG5I8zum1fXUh
	uYyNCkuh2Nc3SshsoIStRTm0nSpxNuXi+O+PYzf2ukEN5ycSjufszmbAGBf819bkX3/de2jigMj
	QyZ6jXeY79z0TxY6PaLo1yyaw==
X-Gm-Gg: AZFdTZdxc56WmI4l3gMWoqwm7RIGnFzGsof9iKHOSitEM+WeWuIvXQZJxSGim5uEFH8
	F8dTBFgQk9AeVqvtbac7tw8dFzeo8SLuteGs7LPLTSI2yQc84u07VVk/CKwHoqkAVosb5E6bk2m
	tYTjFhcqZV3rndk48AsI1yAsjC9x8wT9U7KjIVrdLAqbbTwVI8E5+d6TcKfqDuujvLA7LuFZhKv
	fAR0soRx2wQBTNVGOK2cwSI5C+xouLQD2R+PbL6JG1G4G71EHwJusAyz+FyucA4CpHSg/rFCgWW
	pioDRyCm427sKsw/72xJWyjM7EK8yrYQ0wB8Q9ILVeLmW4i3Q+iGbV1Bt6PiWVFcqUu3xAI2FJ4
	uOGsJ+HfkKYPhTEHQ6tYy0X26sVN+vunT5sRcgObzZhOEAiVcX6nAyArd4DxlKacS6NO48x9y5/
	k8tQ7t8KROm4cURFaMXiwEtQg0FV65BwrHPSHk8FnyeQ==
X-Received: by 2002:a17:90b:4490:b0:3b0:a7b5:c044 with SMTP id 98e67ed59e1d1-3b41c7bbef0mr5780355a91.1.1795378188787;
        Sun, 22 Nov 2026 12:09:48 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-100.dlp.protect.broadcom.com. [144.49.247.100])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b41d245549sm3578699a91.2.2026.11.22.12.09.47
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 22 Nov 2026 12:09:48 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f5844cb60so505332385a.0
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 12:09:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795378186; x=1795982986; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kTiDmMcQejKcdkn+MG3mE/4LRNga/Ihe5FTdQb6iz0E=;
        b=PBVZvW+Jd/JLYm+a8nH61fatpfkzYpnosP+OCu0WRmpU+Ll23XjPdqzyaEkzW2idVw
         30TXauwNC6ghTBVZVPa9ajnA3fBIhtK44PtPqV4Vwx8Sz8hxesNGbTXmWkYFGpHmMPP4
         IkJjjLaVfq6Xwq1r5nKGRKqZ4sLbXQb58+uAk=
X-Forwarded-Encrypted: i=1; AL+hErG3Wxkd2Yftth8YMWGsOjK5jmnBXtXh9tAKa2Z0QoSvyK1H97MmHbN1hgzD3dIwiZrJAUVIz1+h4Bcdafo=@vger.kernel.org
X-Received: by 2002:a05:620a:318a:b0:93e:c853:fc07 with SMTP id af79cd13be357-949baa0618fmr1654099885a.32.1795378186233;
        Sun, 22 Nov 2026 12:09:46 -0800 (PST)
X-Received: by 2002:a05:620a:318a:b0:93e:c853:fc07 with SMTP id af79cd13be357-949baa0618fmr1654096085a.32.1795378185743;
        Sun, 22 Nov 2026 12:09:45 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb34ac11sm664845385a.14.2026.11.22.12.09.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 12:09:45 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Andre Eikmeyer <dev@deq.rocks>
Cc: arend.vanspriel@broadcom.com,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Yossef Osman <Yossef.Osman@proton.me>,
	Aditya Garg <aditya.garg@linux.dev>
Subject: Re: [PATCH 6/7] wifi: brcmfmac: add vendor commands for AWDL
Date: Sun, 22 Nov 2026 21:09:30 +0100
Message-ID: <20261122200931.2090372-5-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261104151547.70333-7-dev@deq.rocks>
References: <20261104151547.70333-7-dev@deq.rocks>
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

On Wed, 4 Nov 2026 16:15:46 +0100, Andre Eikmeyer <dev@deq.rocks> wrote:
> AWDL election, peer discovery and services run in user space. The
> firmware sends and receives the AWDL frames and the data once the host
> has set its AWDL parameters. Add vendor commands of the Broadcom OUI on
> the primary interface for that:
>
> - AWDL_START creates the AWDL interface with the given MAC address and
>   starts AWDL with the given TLVs. AWDL_STOP stops it and removes the
>   interface. Registering and unregistering the network device needs
>   RTNL, vendor commands run with the wiphy lock only. Both commands
>   therefore run in a work item and report their result with the vendor
>   events AWDL_STARTED and AWDL_STOPPED.
> - AWDL_SET_FRAMES replaces the TLVs the firmware sends, the TLVs of
>   awdl_payload and awdl_oob_af_auto. The driver adds the headers.
> - AWDL_SET_SYNC sets the master to synchronize to, with its metric and
>   the distance to it. Leaving out the master makes the device its own
>   master.
> - AWDL_PEER_ADD and AWDL_PEER_DEL add and remove a peer data frames go
>   to. AWDL_PEER_ADD takes the HT and VHT capabilities elements of the
>   peer, which macOS builds from the AWDL TLVs of the peer and passes in
>   awdl_peer_op.
>
> The other firmware parameters of AWDL are set by the driver in the
> order and with the values macOS 15.4.1 sets on the BCM4377 of a
> MacBookAir9,1. The BCM4364 gets slot_bss without SDB,
> its firmware traps with the SDB form while the station is on 5 GHz.
> Some parameters change 500 ms and 5 s after the start.
>
> The AWDL interface is removed before system sleep with an AWDL_STOPPED
> event.
>
> Tested-by: Yossef Osman <Yossef.Osman@proton.me>
> Tested-by: Aditya Garg <aditya.garg@linux.dev>
> Signed-off-by: Andre Eikmeyer <dev@deq.rocks>
> ---
>  .../broadcom/brcm80211/brcmfmac/awdl.c        | 586 +++++++++++++++++-
>  .../broadcom/brcm80211/brcmfmac/awdl.h        |  53 ++
>  .../broadcom/brcm80211/brcmfmac/cfg80211.c    |   5 +-
>  .../broadcom/brcm80211/brcmfmac/vendor.c      |  78 +++
>  .../broadcom/brcm80211/brcmfmac/vendor.h      |  86 +++
>  5 files changed, 804 insertions(+), 4 deletions(-)

[...]

> @@ -53,10 +58,123 @@ static const u8 brcmf_awdl_bssid[ETH_ALEN] = {
> +};
> +
> +/* awdl_election_tree: the master at 0x0f, its metric at 0x15, distance 0x19 */
> +#define BRCMF_AWDL_ELECTION_ADDR	0x0f
> +#define BRCMF_AWDL_ELECTION_METRIC	0x15
> +#define BRCMF_AWDL_ELECTION_DISTANCE	0x19
> +static const u8 brcmf_awdl_election_tree[] = {
> +	0x00, 0x00, 0x00, 0x41, 0x00, 0x00, 0x00, 0x00,
> +	0x05, 0xba, 0x00, 0x00, 0x01, 0x03, 0x04, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x41, 0x00, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x00, 0x00,
> +};
> +
> +/*

These tables are patched at fixed offsets (0x0f, 0x15 and 0x19 here, and
in slot_bss, awdl_opmode and awdl_peer_op). Say in a comment that they
are copied from the macOS trace and not otherwise documented, and name
the firmware versions they were verified on.

[...]

> @@ -335,6 +455,461 @@ int brcmf_awdl_decap(struct sk_buff *skb)
> +/* Sets a firmware parameter of the AWDL interface, errors are only logged */
> +static void brcmf_awdl_set(struct brcmf_if *ifp, const char *name,
> +			   const void *data, u32 len)
> +{
> +	int err;
> +
> +	err = brcmf_fil_iovar_data_set(ifp, name, data, len);
> +	if (err)
> +		brcmf_dbg(INFO, "AWDL %s: %d\n", name, err);
> +}
> +

brcmf_awdl_set() only logs a failure at INFO level, so AWDL_START
reports status 0 when the firmware rejected awdl, awdl_config or
slot_bss and AWDL is not running. Return the error from
brcmf_awdl_set() and fail brcmf_awdl_enable() on the iovars AWDL needs
(at least awdl, awdl_config and slot_bss). User space then gets the
error in AWDL_STARTED and the interface is removed again. The same
goes for brcmf_awdl_refresh(), which makes SET_FRAMES and SET_SYNC
return 0 whatever the firmware says.

[...]

> @@ -335,6 +455,461 @@ int brcmf_awdl_decap(struct sk_buff *skb)
> +	u8 buf[sizeof(brcmf_awdl_slot_bss)];
> +	u8 *s0, *s1;
> +	int i;
> +
> +	memcpy(buf, brcmf_awdl_slot_bss, sizeof(buf));
> +	/* The BCM4364 firmware traps with the SDB form while the station is
> +	 * on 5 GHz
> +	 */
> +	if (drvr->bus_if->chip == BRCM_CC_4364_CHIP_ID) {
> +		buf[BRCMF_AWDL_SLOT_SDB] = BRCMF_AWDL_SLOT_SDB_OFF;
> +		for (i = 0; i < BRCMF_AWDL_SLOTS; i++) {
> +			s0 = buf + BRCMF_AWDL_SLOT_SLICE0 + 2 * i;
> +			s1 = buf + BRCMF_AWDL_SLOT_SLICE1 + 2 * i;
> +			if (!get_unaligned_le16(s0))
> +				memcpy(s0, s1, 2);
> +			memset(s1, 0, 2);
> +		}
> +	}
> +	brcmf_awdl_set(drvr->awdl.ifp, "slot_bss", buf, sizeof(buf));
> +}
> +

Chip checks like this one are not preferred. feature.c already
carries the per-chip and per-firmware handling (quirks). Set a quirk
for the BCM4364 there and test it here.

[...]

> @@ -335,6 +455,461 @@ int brcmf_awdl_decap(struct sk_buff *skb)
> +int brcmf_awdl_vndr_stop(struct wiphy *wiphy, struct wireless_dev *wdev,
> +			 const void *data, int len)
> +{
> +	struct nlattr *tb[BRCMF_AWDL_ATTR_MAX + 1];
> +	struct brcmf_pub *drvr;
> +	struct brcmf_awdl *awdl;
> +
> +	drvr = brcmf_awdl_vndr_parse(wiphy, data, len, tb);
> +	if (IS_ERR(drvr))
> +		return PTR_ERR(drvr);
> +	awdl = &drvr->awdl;
> +	if (awdl->detached)
> +		return -ENODEV;
> +	if (!awdl->ifp && awdl->op != BRCMF_AWDL_OP_START)
> +		return -ENOENT;
> +
> +	spin_lock(&awdl->lock);
> +	awdl->op = BRCMF_AWDL_OP_STOP;
> +	spin_unlock(&awdl->lock);
> +	schedule_work(&awdl->ctrl_work);
> +	return 0;
> +}

AWDL_STOP while AWDL_START is still queued replaces the pending
operation, there is a single op slot. The START is dropped without an
AWDL_STARTED event, and the STOP finds no interface and reports
AWDL_STOPPED with -ENOENT. User space that sends START and STOP back to
back gets a start that is never answered. Reject the STOP with -EBUSY
while a START is pending, or keep both operations pending and run them
in order.

[...]

> @@ -8,12 +8,97 @@
>
> +/**
> + * enum brcmf_vndr_evts - vendor events of the Broadcom OUI
> + *
> + * @BRCMF_VNDR_EVTS_AWDL_STARTED: result of %BRCMF_VNDR_CMDS_AWDL_START with
> + *	%BRCMF_AWDL_ATTR_STATUS and, on success, %BRCMF_AWDL_ATTR_IFINDEX.
> + * @BRCMF_VNDR_EVTS_AWDL_STOPPED: the AWDL interface was removed, after
> + *	%BRCMF_VNDR_CMDS_AWDL_STOP or before system sleep, with
> + *	%BRCMF_AWDL_ATTR_STATUS.
> + * @BRCMF_VNDR_EVTS_LAST: number of vendor events.
> + *
> + * The value of an event is its index in the vendor events and its vendor
> + * subcommand.
> + */
> +enum brcmf_vndr_evts {
> +	BRCMF_VNDR_EVTS_AWDL_STARTED,
> +	BRCMF_VNDR_EVTS_AWDL_STOPPED,
> +	BRCMF_VNDR_EVTS_LAST
> +};
> +
> +/**
> + * enum brcmf_awdl_attrs - attributes of the AWDL vendor commands and events
> + *
> + * @BRCMF_AWDL_ATTR_ADDR: MAC address, of the AWDL interface or of a peer.
> + * @BRCMF_AWDL_ATTR_PAYLOAD: AWDL TLVs for the firmware parameter
> + *	awdl_payload.
> + * @BRCMF_AWDL_ATTR_OOB: AWDL TLVs for the firmware parameter
> + *	awdl_oob_af_auto.
> + * @BRCMF_AWDL_ATTR_MASTER: MAC address of the master (u8[6]).

Two points on this interface. The vendor commands are the exception
agreed for AWDL, which makes this header ABI that cannot change after
merge:

- AWDL_STOPPED is only sent for AWDL_STOP and before suspend. When the
  firmware removes the AWDL interface on its own
  (brcmf_awdl_if_removed() in patch 4) the net_device disappears and
  user space is not told. Send AWDL_STOPPED in that case as well.
- brcmf_vndr_cmds and brcmf_awdl_attrs start with an UNSPEC entry,
  brcmf_vndr_evts does not, so AWDL_STARTED is subcommand 0. Add an
  UNSPEC entry here, and describe BRCMF_AWDL_ATTR_UNSPEC in the
  kernel-doc, the kdoc check warns about it.

Regards,
Arend
