Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795552475;
	b=EOf0aapovRnvZLd2mngFpue1tZAXI1IwM5g7EKtgpqx4vJZxr8rduQ1G8tsfPTfTc5Wj
	 PcJnYfJiyWL9v7Mxqu5AtJAxndsO8QZGYqnb6+9dUZgI3Np9FQ+3Iz7HbzOwPZdklRnke
	 lfASjOhQK+Oj5W4zpOIPKQAIcU+VGXmxtuov2Azm5WEtfSr7E0cEIHbgqXPH9jtdSR3ua
	 TqxW/O2Oh10oZyB/VqJL8tzl2fgPbnsfmD6MZURdgv5aCJ240wWzUALL0ckMRPAX5a2/p
	 /soG9C2UpEVjONrWG+13EixFU9tEiCIC6Lo+fXoa0rLnndWfRDSjlcXMZBIembx7pyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795552475;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:Mail-Followup-To:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=0gGPj4kTELj+B35v7ZlhFCknxenwumFRIKQjKFG/xkU=;
	b=WwDlf65W2el9HP4/HbT69QF8dJ5Pn2Uf2BCX/6dSGJ/dYb9NamVI71HlaVax7jA+sVWg
	 oe8c6TPUkC1zfpCfkXQn2mC3R5iHkb1Sn/EuCJt5VP//SrnanflqQ1Da2fIjrlXtGD7gK
	 TmwZU+AGtQ981xqFemN/rlSoBeJJyEDqHGFv9NEknOUxRuzmjkKKXRU5igd6Po16BUb8p
	 +QtrgRROJU+1HBH4zcNUuqtquuwgdTjJAUGltCstJ4bb+Y/SNd4LKZr62E/ggHDKvVhS6
	 cOrfT2MdemW3aBOEah1cUfYwu3oObzzqjrxKtiNoDdYitZLH2nD9w8+am9VW4xWBdLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=dama.to;
	spf=none smtp.mailfrom=dama.to;
	dkim=pass header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=IWFzJg6x;
	arc=none smtp.remote-ip=209.85.210.177
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C38BE606A31E
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 20:34:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C38BE606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20260707.gappssmtp.com header.i=@dama-to.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=IWFzJg6x
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8b9c51097e2so1860834b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 12:34:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20260707.gappssmtp.com; s=20260707; t=1795552474; x=1796157274; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0gGPj4kTELj+B35v7ZlhFCknxenwumFRIKQjKFG/xkU=;
        b=IWFzJg6xpnqE4fcFC7weA1Yt35QZia/OaODNyYpNfPHlDKe0Py4VliVOwLl30ZXM/Y
         N+YBqMG8efYJZB6sQZYB5qvsE/372NF6ZWJc+K38zWbYDIpeixDJY7E0J3KLm9BOj8hG
         WaKLpRnlE3VQ2Bct0Ay2E9OiYX50z8SfFs5kPD2gwmTnopgePSS7rSSy64a80RZgJqdH
         Zmv4/W4qoZ1rAffs7KAl8Q8ltprdw6EeCJ/ZAoUznQCkqUJo/gzMs9G4tYd0k3KSphVv
         n4W7wLHLm45uGgX1eC0sljKcuI6sFhWrGX3MFAMQgehHHvoY6IfeNWyWy/2r7yCsKbFz
         2+eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795552474; x=1796157274;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=0gGPj4kTELj+B35v7ZlhFCknxenwumFRIKQjKFG/xkU=;
        b=RtnBwipPXwUpI0VkCX8rOPPHVMxCylpOsqAfopVm5zR58LnKGIeZIgIjW85/dPF5qk
         95jCocQyqw+Ti62rThdmwDxN+km67cUAUdrgAxtITZc9o1LFO1ZcBPtvox5YZk794yuO
         aYnrIV/N6UEPMwEIetadZmK0LFYmLtirTmLyLzYuEiKDhbupGPnC0sFDUbPBESgpP3n4
         ERBQx20MlKG76DCC1W5Yttx+myEAksuAl8AwrFS8TEdJ78CIdIO09wgyPVEzN3bIHlmH
         R/4hA1Dxl+s/Jbp8a40BP+dKa6LsSMudmpOIBEuRXbZ89GvM9+PKMQXrnLRNLT/6YeC+
         repA==
X-Forwarded-Encrypted: i=1; AL+hErG/71ZklXcXAvaYZ7MIo5Nj1sUlx9bWn9ZGpGHp+wB0SLLR+ovgDWUVB34y9PK6dJT6EjxzD29/gU7K/CI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+zcZvJWCUXTrlIV9O88LjlVTinyv3AbHuFSyC+8Ku1Mt2s/xVq
	zlLCVZ+QUKt5ThsNs1cEYF9UTih7CEa4RquvZRkS83KZleG8xOUpUpdExwzFCMsYDhU=
X-Gm-Gg: AZFdTZeaG/c8lMw1mzKWoYfx55/LA/2rPj1lyr9FTk6DHnfl5ccksWp5Eifik+uBAck
	DDWbwwVJKl4V6AF0K2Z0XlKees6i82eKSXHURKuqG4m32bW04/yY679os6XiRZhooOj4FD5LOOe
	IApeaRiT+PyEKyYCOOJ5/2b9OdOrGgiqcE/f2qMPIpZx/aVUfheMfNjwjUOlraI6hDTvIk9mY5Q
	CC2PYdG5ZPdDe3ZxeAtqM8Qz1WCbLwQ9UNJ/qen9QZ4fmDk3Tor0/Ik8kF7fOPUu311Snbg+l2t
	7/FX26kKSJpeNtL2361ilghru10nM8ipezGNR1bVV7oTsQjQlyRT3LxezJzfFkfbS/Av29rm82J
	fUX2/a85trj5KoBn9J4bINKmcaB4K4DTY9aiz7Ha98MunUtgH5+VeegyR7gDBm/781RTL2X+jdg
	Wp/mwMjdH+6fg35EU+4nh/7OcL3iIA1qguQaXTRvaQ+rn6hvegqYluR6tWwMNfTuCEwYfVJS8+7
	PJc62tthMmOCcOIHkDaNcEKzP1dl/zm0w9aRFBPf520QRZRO0Zohfv4Lca3W58rv7svxGX6L3TK
	B+fdl61aLTKBqOeGk1+V2T//yQBdZEI0CwcnHl/tr+0=
X-Received: by 2002:a05:6a00:4518:b0:89e:f2d2:1eab with SMTP id d2e1a72fcca58-8c87cf2a12amr12263594b3a.42.1795552474083;
        Tue, 24 Nov 2026 12:34:34 -0800 (PST)
Received: from localhost ([2a03:2880:2ff:4b::])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87343f726sm8048209b3a.36.2026.11.24.12.34.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 12:34:33 -0800 (PST)
Date: Tue, 24 Nov 2026 12:34:31 -0800
From: Joe Damato <joe@dama.to>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Narcisa Vasile <narcisav.kernel@gmail.com>,
	netdev-bot+sashiko@kernel.org, michael.chan@broadcom.com,
	pavan.chebbi@broadcom.com, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@kernel.org, pabeni@redhat.com,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next] eth: bnxt: report TX HW GSO queue stats
Message-ID: <awX01xqN2suPZqE1@devvm20253.cco0.facebook.com>
Mail-Followup-To: Joe Damato <joe@dama.to>,
	Jakub Kicinski <kuba@kernel.org>,
	Narcisa Vasile <narcisav.kernel@gmail.com>,
	netdev-bot+sashiko@kernel.org, michael.chan@broadcom.com,
	pavan.chebbi@broadcom.com, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@kernel.org, pabeni@redhat.com,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261116204313.23023-1-narcisav.kernel@gmail.com>
 <179499144094.3136.198428718668517773@kernel.org>
 <av/RAwaDfiQnPmbF@gmail.com>
 <20261120154835.0f56c410@kernel.org>
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
In-Reply-To: <20261120154835.0f56c410@kernel.org>

On Fri, Nov 20, 2026 at 03:48:35PM -0800, Jakub Kicinski wrote:
> On Thu, 19 Nov 2026 20:48:03 -0800 Narcisa Vasile wrote:
> > > [Severity: Medium]
> > > Can this over-count wire packets for GSO skbs that were sent through the
> > > TX push path?
> > > 
> > > This block runs before the is_push early-out. It treats every completed
> > > skb with skb_is_gso() && !is_sw_gso as segmented by the hardware.
> > > However, the push path gate in bnxt_start_xmit() does not exclude GSO
> > > skbs:
> > > 
> > > 	if (free_size == bp->tx_ring_size && length <= bp->tx_push_thresh &&
> > > 	    skb_frags_readable(skb) && !lflags) {
> > > 
> > > The push BDs never set TX_BD_FLAGS_LSO or tx_bd_mss, so the NIC sends
> > > the skb as a single frame.
> > > 
> > > Take an idle ring with tx_push_thresh at 164 and a GSO skb of 164 bytes
> > > or less. Two examples are TCP with a peer-advertised MSS of 48 and 96
> > > bytes of payload, or UDP_SEGMENT with gso_size=8 and 80 bytes of
> > > payload. Either skb would be counted as 1 hw_gso_packet plus gso_segs
> > > hw_gso_wire_packets, even though only one frame went on the wire.
> > > 
> > > tso.py reads these counters, so could this give misleading results
> > > there? Fixing the push path issue described below would also fix this.
> > 
> > This couldn't give misleading results there, since no GSO skb in tso.py
> > can be 164 bytes or less, so none can take the push path.
> 
> Fair, but UDP segmentation may sneak in there. I will check with Joe.
> Either way, I agree that this is orthogonal.

I think this is a bug, yea.

I think HW USO can hit it. A small gso_size with UDP_SEGMENT can fit under the
push threshold and that skbw ould go out unsegmented. I think this would
affect Thor2 devices that have HW USO.

I don't think SW USO is affected, though, since it segments before the push
path.

I'm gonna update uso.py to test a small MSS which should trigger this on a
thor2 nic.

Narcisa were you planning to send a fix for this bug? If not, I can, but I
didn't want to step on your toes if you were about to send something :)
