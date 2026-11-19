Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795125651;
	b=EkE/0JK55ofjTap3kE2QpnzObn3R6naykQJsfED169bzNXAxm4ZdgGFxu6mvi7/XMeu7
	 GY5ue07APiLsyP22lO0EfmlUabjeyp08+lLJZGXVSY/KxXR0tzp6+CTk1mfSJ+zew1LNS
	 qybXHKIBgaw3no7kdMFoqtiRHdLc0WjaLUO7SYshIO+bUaVTUqsOz2F0d0HYQ902GtsLp
	 puIjqk3j+fLjF1DlPxMUOTbtmUkPS3X9xEpR8DhiROVkPwbOIwxmWviOypgqIMk77smhJ
	 HDJss+0ffoR/XR0RIsZ91GJTkXTUHhVLV9bRw4ZzeGYeIKeSOUicUTzrIQY5DA4HNUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795125651;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=X66C2Y97QEn08StEZw2JtK4Gx5mmk6aaLSYZ3CIF8TI=;
	b=Pmt2eC+AeWYSJXoGYmh9e/CW2yhrn1GF7+kLQscUzk8hL6uMgg0ts1UHkRG5uLScs0oX
	 rjXQCpL70Gk7K6JMBmOdeZxVuU3iO4GjJyaF9kQC3uNLHYJSwl33BRNG0EhcHdrEWJJb5
	 89JCw7LkLirEklvjTvzA/cx0ms280/bkSU7v440M8XFGPfedKhYtfchcIz94pQbXWlsb3
	 wdeCy8jQVuJ6qj3PbVMSdEQ829ynmEy3Uiivk1C4uP67Dystpg7EjKcBFCGnPQvy2kPgP
	 tifYtzkwCxUl9SeuuckXMowAKQg90Wth/jzIodM2an0gWPwzjw6V7P08185gJiFkg7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=V+irdR59;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=EuYBfGL1;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F178606A333
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 22:00:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F178606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=V+irdR59;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=EuYBfGL1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795125649;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X66C2Y97QEn08StEZw2JtK4Gx5mmk6aaLSYZ3CIF8TI=;
	b=V+irdR59jjx+GZ3fFXkGs4e/9q52SL5LFb89WukAOTNOw5uK7JboVSmg7q2eTqz7mZCbyF
	XRrkYHG5OelVReqA9dYNqYeCBXjanFcdnG6hTl4PbST8iNhaBEW9diPTB5Bg8kmiefwt4k
	MIQ/O/BkM+0A2jG1jMUYwvB88JYjIog=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-551-VqzoUTvCMKCBpypBdnp6Iw-1; Thu, 19 Nov 2026 22:00:47 +0000
X-MC-Unique: VqzoUTvCMKCBpypBdnp6Iw-1
X-Mimecast-MFC-AGG-ID: VqzoUTvCMKCBpypBdnp6Iw_1795125646
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-49b8bd66a51so43535e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 14:00:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795125646; x=1795730446; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X66C2Y97QEn08StEZw2JtK4Gx5mmk6aaLSYZ3CIF8TI=;
        b=EuYBfGL1HxZzM/28OS0t2p+j2Ti2Z2PQAx4vTNJZD/B1crrT5Ec8OFjcSj4LxlLsPS
         1ZW3VApZtlVtvErf+W6mE0PamRnsxB8RwnYso0TS4+FlOvq/pphhBEEru+KCaZn68bQJ
         WPurgqGKPXFtbCuKP5iZwPqITh9rQn0rJXFkMToc0qoqeBpWlTG4beQEukgEGdCP1dZ4
         7W4nZZN/8Mi3Mv5HEBa/tP8xGMsDuHtE3BuO9kn5ExtiIzFrVOwroJLS8rVIWL/dyKXM
         eE11g8vH7l05sdNloQXaFH7ti2M87mPLkY70xzhbFFoVK6rblv8bPI06Fzr7L6WCKhXl
         uGlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795125646; x=1795730446;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=X66C2Y97QEn08StEZw2JtK4Gx5mmk6aaLSYZ3CIF8TI=;
        b=MkcjROcIwurByL4QPDTHnI5qUDo6h8vGaoQG2OislBib+azxn3aZkI6CnZx38MN1H4
         z3A3EjVydJcMua6KU4gJN9Po9TpPvXyt/qgxr2OeatXuUTYz23fUIpYQDOLs2/BOh9CK
         XAY5ejwI0gSKWc7THhmgbtA91SH73NpnvHbgddYeQBSsR5oU/1eqmALdDpIV5Dq74Bjp
         ZBDm6Zk+xMRffv8qfue53Bc921Bcyw+Auj6kVS48z2+7sLgODvCvXyQPIDBHhC2hcItd
         QBfSOfoln7vdCzNs0HJQomOigpDlI70wpKGqmjPJmh4yxBj4CBjamqBy9NOgeJ9JJ/Hp
         kiSQ==
X-Forwarded-Encrypted: i=1; AL+hErGDdRTnGchP3rsUzYxjLpKfNCSAkwk4K1Lr47gBtpdI1YtdCyImeDX6gLGI2G3HINfvtlqEwztRCNr3RQc=@vger.kernel.org
X-Gm-Message-State: APuU4Z8VZI3GL/3HIzs8dLMc/0wVlsB5zi9Q4YH9ZOWx/hY0w4+gOpuO
	wLpfpN+E3XYjfwjXNR4Ky+QS18PQCEEhVQRInhZCtkgKY3ul8KkGmqrr/zLKldXv0T9yqxnwVkj
	LN4N2H2WH13cBUdKNkzYxrJjdW129D/bSYBXxuV4tt5KqAalwC/qvr0Uni8ROcjRukl2gwYA1LN
	HZ
X-Gm-Gg: AYBFou1+s/8DxfqPN0cNTjRnsdFVUugdy/j2lSHGA/Sp0kPeWoDByt3mMD0Tp5Jwue3
	1agaXvXfQc7JrxXqm8ichpcQyTETUlQTMBo0oVOuNiWk7lyl/1to1RxDDMVUVorCO26vy/l0zxW
	NmM8/doJWAsG703hIj7U8W7iGc6gTpidWlnCTm2UCkHm/6YnkTfrMYPUScNgHcUwuR6QnhGCoi1
	hW0iGorz09ycFC51p2IfY434uZ6cK/c+1LQ/VpN1zrK3hMQCJjX9DOEpuCqioCb/zJTW/EXiKG/
	MgCvb1pcgmGNVTHCa928FnC3LDTtvaKO7qrw/YheohGUlZZ7yFo3ugnY22cz376b59IT4qQNuhx
	6uA3Lzp1t4YaLSfmS/qnOG4piBFgXk/PLzjtp+GpQq2wctiRXqQp8euZapVh7mjpNsb0wtfExm6
	4LjJwiOFM0Jhsvuw==
X-Received: by 2002:a05:600c:21ca:b0:4bb:68ed:a356 with SMTP id 5b1f17b1804b1-4bb887ec919mr15282025e9.1.1795125646303;
        Thu, 19 Nov 2026 14:00:46 -0800 (PST)
X-Received: by 2002:a05:600c:21ca:b0:4bb:68ed:a356 with SMTP id 5b1f17b1804b1-4bb887ec919mr15281675e9.1.1795125645874;
        Thu, 19 Nov 2026 14:00:45 -0800 (PST)
Received: from localhost (119.red-83-42-172.dynamicip.rima-tde.net. [83.42.172.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2d1bsm1963679f8f.8.2026.11.19.14.00.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 14:00:45 -0800 (PST)
From: Enric Balletbo i Serra <eballetb@redhat.com>
To: netdev@vger.kernel.org
Cc: Claudiu Manoil <claudiu.manoil@nxp.com>,
	s32@nxp.com,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Wei Fang <wei.fang@nxp.com>,
	Clark Wang <xiaoning.wang@nxp.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Enric Balletbo i Serra <eballetb@redhat.com>
Subject: Re: [PATCH v4 0/6] net: enetc: S32N79 pseudo-MAC (PPM) networking support
Date: Thu, 19 Nov 2026 23:00:34 +0100
Message-ID: <20261119220034.1658710-1-eballetb@redhat.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <4f51bfd237fa584c7d9187d7b82f36e261853ea3.1794581338.git.claudiu.manoil@nxp.com.mbx>
References: <4f51bfd237fa584c7d9187d7b82f36e261853ea3.1794581338.git.claudiu.manoil@nxp.com.mbx>
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

On Fri, Nov 13, 2026 at 05:02:31PM +0200, Claudiu Manoil wrote:
> This series adds networking support for the ENETCv4.4 pseudo-MAC (PPM)
> ports found on the NXP S32N79 SoC. On S32N79, the ENETCv4 ports are
> not wired to any external PHY/MII; instead they are internal "pseudo-MAC"
> links into the on-chip NETC switch. These links are proprietary, expose
> no standard IEEE interface, and run at a speed fixed at boot time by the
> Port PCR[PSPEED] register.
> 
> A key use case is a port that has no "ethernet" DT node at all: NETC is
> reached over PCI from a host that probes the ENETC, while the internal
> NETC switch it connects to is not owned by Linux. Such a port must have
> its fixed link synthesized at probe time.
> 
> The driver synthesizes the fixed link directly in C using an of_changeset:
> of_changeset_create_node() adds a "fixed-link" subnode onto the PCI
> function's dynamic OF node (CONFIG_PCI_DYNAMIC_OF_NODES), with the "speed"
> property read from PCR[PSPEED] at probe time and "full-duplex" set.
> phylink then picks up the fixed-link node through dev_fwnode().
> 
> The series touches three subsystems:
>   - net/enetc:  pseudo-MAC fixed-link support, probing of 4.4 devices
>                 and a fix for more than 6 ring interrupt vectors
>   - arm64 dts:  NETC IEP18 ECAM node on S32N79 and its RDB board enable
>   - PCI:        a quirk creating the OF node for the ENETC PMAC functions
> 
> Because this is primarily a networking feature and the pieces are
> interdependent at runtime, it would be most convenient to merge the
> whole series through the netdev tree.
> 
> Patch 1 has a runtime (not Kconfig) dependency on
> CONFIG_PCI_DYNAMIC_OF_NODES; absent that, the pseudo-MAC probe path
> fails gracefully with -ENODEV.
> 

Hi Claudiu,

I tested this series on the S32N79-RDB board running latest mainline kernel
and applied your v4 pseudo-MAC/PPM patches on top.

I used, though, the MRU MSI controller for NETC IEP18 overriding
the upstream msi-map property with msi-parent pointing to
the NXP MRU MSI controller (this driver is not upstream yet but I ported it).

With that configuration the ENETC PF probes successfully and networking is
functional on the board. So,

Tested-by: Enric Balletbo i Serra <eballetb@redhat.com>

[1] device-tree diff

diff --git a/arch/arm64/boot/dts/freescale/s32n79-rdb.dts b/arch/arm64/boot/dts/freescale/s32n79-rdb.dts
index 897ba24ac03a..a8a3602505e2 100644
--- a/arch/arm64/boot/dts/freescale/s32n79-rdb.dts
+++ b/arch/arm64/boot/dts/freescale/s32n79-rdb.dts
@@ -70,5 +70,37 @@ &usdhc0 {
 };
 
 &netc_iep18 {
+       /delete-property/ msi-map;
+       msi-parent = <&mru_msi_controller>;
        status = "okay";
 };
+
+/ {
+       aps-bus {
+               compatible = "simple-bus";
+               ranges = <0x40a00000 0x0 0x40a00000 0x2000000>;
+               #address-cells = <1>;
+               #size-cells = <1>;
+
+               mru_msi_controller: msi-controller {
+                       compatible = "nxp,s32n79-mru-msi";
+                       msi-controller;
+                       reg = <0x40a40000 0x40000>,
+                             <0x40a80000 0x40000>,
+                             <0x40ac0000 0x40000>,
+                             <0x40b00000 0x40000>,
+                             <0x41a40000 0x40000>,
+                             <0x41a80000 0x40000>,
+                             <0x41ac0000 0x40000>,
+                             <0x41b00000 0x40000>;
+                       interrupts = <GIC_SPI 705 IRQ_TYPE_LEVEL_HIGH>,
+                                    <GIC_SPI 706 IRQ_TYPE_LEVEL_HIGH>,
+                                    <GIC_SPI 707 IRQ_TYPE_LEVEL_HIGH>,
+                                    <GIC_SPI 708 IRQ_TYPE_LEVEL_HIGH>,
+                                    <GIC_SPI 735 IRQ_TYPE_LEVEL_HIGH>,
+                                    <GIC_SPI 736 IRQ_TYPE_LEVEL_HIGH>,
+                                    <GIC_SPI 737 IRQ_TYPE_LEVEL_HIGH>,
+                                    <GIC_SPI 738 IRQ_TYPE_LEVEL_HIGH>;
+               };
+       };
+};

