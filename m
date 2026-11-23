Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795473089;
	b=5Q0gB2xXUP7GsEwbjbu/u2Jfu2RLSgAPxTLmkxgT66rFJzAZg45yoh1eQNM5uiOqpE8G
	 Sg1T4ifv7TAHp36AkRERuyrrcveAweKG5xnAMAevlLfpDZz6enGXTcg20lv+qq3WiDey3
	 M6NnkqlN1IBojy34zb0Gq8cDS14DgQ/jSGqzqOpsuU5S3hNucHaZC/2LbHKxg57ClWm0A
	 AunDjSSbB8FhK/NBCwgiftZsVTQQs4z8EIQqz1EWyXjYUd+PDdz57jBqBVreKFZ/L17xs
	 DU6PlQh6PtqAYgQuhEmvPoqtFAFdmn2U+Bzzx9k2yhPUNoQ1WAat7wfT0DKyvuLZ8Xg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795473089;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=Ax0eaG/jsWAkDsExZygRxtPuN7mkDGzN/6dMy4dDBRk=;
	b=VNyfPLMApl/H0pIkuHXMsjQVElBEbrMHUXntY4NtZVLEmeu2ET39tz7bETEW3B8Y0Zzx
	 ASzTYN3q+So8aYRFSG3MJfch0xhOv/qosefeZRSlaM3oSpQYKHwfkw2x8uiP+ux5yhMCB
	 0pHlfvWfFjh6ehYMZJYgkHp+Hh9G8qjcnmdTPgqFfTrJdr6sjpVlZMbYtNCGxc3Z9RtRn
	 ZAqI4yUN+K1A5v/G3MDI4tKgXV0tJZ5uIyV+bVhuIv4G6kRVMue1ZMBbbIH3cA4geGMTz
	 MOZOX4H4usGLEcrNt9Nl2F44RtL7QnLWmtL7Wow1/VzY4A/DxRshnkj2y29+ZQ7iYRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YlCAErAB;
	arc=none smtp.remote-ip=209.85.167.43
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ACAB606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 22:31:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6ACAB606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YlCAErAB
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5c14f3dab0cso2215701e87.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 14:31:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795473087; x=1796077887; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ax0eaG/jsWAkDsExZygRxtPuN7mkDGzN/6dMy4dDBRk=;
        b=YlCAErABvSeA3HncMRsR56t8K9bcfLsLA9UItBrKavJ0SpSC7Lc3NsWwBU6JFHrpLW
         vio/WvPHUN08i3vmw6OXqvtfm+sri6unRkoP4lzi17rUtqVlDgSYGjEbXkq6ob+1y3Oa
         VLp7qG2/eyoRRfamv4pJVW+5GV/T+NN87nr2qskak44iC0g6cZx1PJGYr29Qu//2Ts4b
         YZo5hYRUr/I0llLLEpJcPo380RttdeQFS4LgkCpUSMswutkEMSXhE3lgeXbZXZrKtqFO
         fKt+/dh8nnpIrKJ0bfcZDAMaA1+z6C4HgIr/DSmOrZtnzEznZm0jkHn0eS9YRiTM5Feg
         CssQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795473087; x=1796077887;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ax0eaG/jsWAkDsExZygRxtPuN7mkDGzN/6dMy4dDBRk=;
        b=xDW8XFZSgWYteyocgYzQoha4Nxkmo3w0jiWezANDmWkpLajjFFquIJxKf6WP0GRijw
         KAUwUynFn1/muzN6cA00g7I9XBGwdn4B0M4OSB1Szkss6mtzH/HsQIKVp7oxPc4/Ossm
         quvUjh/LdpP7xmaGKxFg9Wcos/LMVFha5+iV03heTA0b8cx4Rb0bxgjgOwccHyAAwJo4
         o/toeqopJOWRiL3uQErh5dX4/QbTSuFHY6c+/w7NLwtkn410AvCJa0Zk2hfpaFqgliPi
         fl5spxEoeVJnICcIinvgtcP16Zvl7fYe+9pNcc0vc22C/MhAQLZMw3sZoRZ6/y8uYo9c
         8eRA==
X-Forwarded-Encrypted: i=1; AL+hErFu5OuMgQk3BA5zDhcMQRrcwCokWx5rAhMEBXHjzehUwju4izCRcSmnsPMsnOdya0DhamuehcBzDiv15gk=@vger.kernel.org
X-Gm-Message-State: APuU4Z9QKCYibYbYm0eCIQ6TThuwBkhRinATafyMbRH6FLe/fYrnBu+F
	KAgO19nkDqioa0Vqn3GVO0RWp+q16sdhWFkrxrmazHdBrlTMoOcK7ban
X-Gm-Gg: AZFdTZfAaQl+IXu2oxWniiW6OmjG+xv5vsxxjhGeMCRzV54mFl6CN8N6dUfUcFP7JrF
	T0GIzNSesC9WdD4j8va5+xsQdZ3YC8PFQ0SQLSQQwmY1G7zvmqIgGX0o1Dd+tJNu7pVc6iYne3x
	gVpIG2B/rZX2i+PkKQPjRFt3R+vnZmtYrT0oKttr0alRb6KQIzfRP6tniTAtO52Mb1FD9Q1SosE
	8msTZ45EQa02YKP4J06ZcFnm6EC1mVvvyGlX3xpdNlKAHTU+otaDqmm8+pmvgQ36LYrIVspmNkj
	oO4DTOd5KoTu4B36IH8Ajdh8iD7KSsL669+VsRlj7WAgZTTH9I+6XEWNl42CFOyfJZkPImgG76N
	LjCKuZHM2hpzIpD6Lp0Ptf7bXA6M3OSUaVblGTJIWTHO++VxFZNN4wJVIAXHeYAY2BckRnTi5vA
	5jcHtosMFXjQNyGzhZrfXLBWMfeIn7YjfgtdK4RZwHzEUGlnwCgTZxn1oWU77zpCiKXPIsBEpRp
	gG6X0Xm3GtOckPcT5lzFyu9YowNOC54DHiaS2w5A49JZGaVL4DrT2JdbDGsl2fvgPIsppvoWfCL
	5gw7tX5MMBPKOWWMPbGGJghlb3gqPXdmTU2sDx9SKKMfvGPwbaW1pbc=
X-Received: by 2002:a05:6512:32cd:b0:5c1:57cd:50b with SMTP id 2adb3069b0e04-5c1bc847888mr3847641e87.14.1795473087230;
        Mon, 23 Nov 2026 14:31:27 -0800 (PST)
Received: from [127.0.1.1] (ip-024-180.users.dtel.ru. [91.210.24.180])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bd052d6bsm3315161e87.65.2026.11.23.14.31.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 14:31:25 -0800 (PST)
From: Fil Dunsky <filipp.dunsky@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Hans Ulli Kroll <ulli.kroll@googlemail.com>,
 Linus Walleij <linusw@kernel.org>, Russell King <linux@armlinux.org.uk>,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject:
 Re: [PATCH net-next 3/5] dt-bindings: net: Add Cortina CS7542 network engine
Date: Tue, 24 Nov 2026 01:31:21 +0300
Message-ID: <179547308136.447306.5703918766544571012@gmail.com>
In-Reply-To: <1d4fce88-c959-4bae-993a-c5aa1d792177@lunn.ch>
References: <20261123-b4-cs7542-ethernet-v1-0-fdb5e8c2d508@gmail.com>
 <20261123-b4-cs7542-ethernet-v1-3-fdb5e8c2d508@gmail.com>
 <1d4fce88-c959-4bae-993a-c5aa1d792177@lunn.ch>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

The hardware has three GMAC interfaces feeding a shared NI/FE, queue
manager, traffic manager and scheduler. The forwarding engine can steer
frames between GMAC ports without the CPU, including rewrite/NAT in the
vendor acceleration path. The posted driver configures CPU forwarding
and exposes the three MAC interfaces; it does not enable hardware flow
forwarding. I should make that shared datapath clearer in the binding.

On Almond+ there is also a separate QCA8337 Ethernet switch. GMAC1 is
wired to its CPU port 0, and GMAC0 to CPU port 6; the external copper
PHYs belong to that switch. Those MAC-to-switch connections are the
reason for the fixed 1 Gbit/s links in the example.

You are right about the phy-mode description. Both QCA CPU port nodes
already use rgmii-id, so qca8k programs the internal clock delays there.
I used rgmii on the SoC side to mean that its peer supplies the delays,
but that is not what the PCB-level phy-mode describes. I have no evidence
of deliberately extended PCB clock traces. I will correct the example
and the SoC MAC nodes to rgmii-id, and explain the fixed MAC-to-switch
connection. The existing QCA delay programming remains in place; the NI
driver does not add another set of internal delays.

I will keep the Ethernet reroll within the requested netdev cadence.

Thanks,
Fil
