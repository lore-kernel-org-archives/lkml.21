Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795873141;
	b=Qwj5U1mXv3L58aUG5bMtptkUtuDoNXjBkZSI2wlr3QrLBwF1cSKnPQ29KlhKlK692MDz
	 E5XsC/dDWPMDjjDACEHinUMe4bPmsMMWA4kV/L/TLNT5OQmodiYw6JY1gWTU6NlwranRy
	 ZUloqOydzSrGfcHrX7zTERq93xHofrt8nlCZCuh2xj+1ibsROFKhpNy/hKwcXDkwWDIP+
	 7IwMiB6nF+CyewQ1/f1J0/ij9ZGA+E/Tu3hJbnkb5F9mZ/jEsTdP9PozDNCDrcozeYuaj
	 hr/O0yuDDpFNmlmOiWSJrDm/YTAHISkOSdKXBJME7YhR65PQkGyKnUhzK7lxBR6htAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795873141;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=4lDF0vQqikD7LUr8D749WPrms9ik25wN2smo9HvyhNI=;
	b=rqkZ69VMcvA32Dixnl1Pl7EWl+HNbBwBpsxoMU77gvPdD/dRZQu6WvB8fuyByhsQkqcB
	 fFLz3K7He4v65TGZX2Hff+JsCI6Hlom6t+NyVLV5xQRiTN8WNWJU8I8O2zfhg7MXWcW+l
	 /H4JBNV87KY6lEdx9Bu3AeT7n6Wrcw/yJxwgFOQXaoQN3/QLEyrIaVNMeAJQltlqSUa9D
	 JcvJcuoIphBfJ6cD/82g1RJJuMzcAgGHKwmF1lozYt7fU4U2YBl1QvgDAWdTHw/9ffBUx
	 tKtb+moN/Wx9pMHOPynv3C6VYWxK0HL6dNSrDNmcaMNHCYRBsCyi+TBozyXo4YcRotA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h0ZO1ZrT;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F015D606A321
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 13:39:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F015D606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h0ZO1ZrT
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4bb702a7548so82079405e9.1
        for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 05:39:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795873139; x=1796477939; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4lDF0vQqikD7LUr8D749WPrms9ik25wN2smo9HvyhNI=;
        b=h0ZO1ZrTkM9NyNAhi4fxHRTUl0gaVwC4ROmUsoC0qiXHFQjZeDXILFRh3Gx2Ui0U3X
         aIjZ4Hv4vALD2DbtMtViShapkv8q4UyeOGuSesqYT7UH3h1xfxKph+nSaDQHxZM3cesf
         z5lj8NJF3QJRh0Up8YdzjBQmc61O5e+m8XQv5wC2Y+mgJlkFAvifbZWS6d+JPS6GF29J
         /+TRJcWOZ/TMPOVKwndYWEj8nbEnvx3ku6lA0Wm/lZ9m3aVpi6oujiAgdIw2Mbecu0zo
         Qo19v5K9pmIpk+r39p5LN+1tnBklNyhpq7ulkSNEfOSm+BVESD9/YKDkXnEr55oqPd9d
         KMhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795873139; x=1796477939;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4lDF0vQqikD7LUr8D749WPrms9ik25wN2smo9HvyhNI=;
        b=KPCKNqkcM/+OeoIHxN4gko58Fn2aROupvn6NWpqETza/jxdx10lPzoSijQ+uxyyMV5
         x5k61AhHHT9aZVzmTijzQyV+Uk7Fo9M1iCfluqSxrUho2FCUD/3E107oI3TpxnTBGXLp
         kx/clvcCd9zP2ie51QyC9NlvLH1fVEoWodYj6GTwrOoXG36SIvYkN8nU0estf50IKvFE
         0CgEmLX6ap7ylLByqN0G6Eqe1xFNCQ8TLQ4QtyE5YfWWsoo1JsKWptjBpDqAl5KEGZhm
         fGHgP/YdOT8x00QNvFPxnsc8ZkbZNKN5b5WKCEbPBGR3ImYYOd+ttvgfzi0QTYhCIkPb
         Zmkw==
X-Forwarded-Encrypted: i=1; AL+hErFsk7oe+KqTdQB7/sgS1VkHjYIjCAno1jx/Ea0NR//pXYz6rTQXDbbubpyD5Or2XBKvqakeXj2sQLbuII8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9Qv55upX9+UfdRO4Ak7Gl+darktXu6iwp871sJ2QN6/1wE4ZnQ
	E7h5C/mnx04e2YVQko2aZuzIT3Ea1bnjffP3a80GOGZLkqygncrllJ7f
X-Gm-Gg: AZFdTZevnrM28jmKn1alJvi3Kv31msph4ajRf5iOt5jHSSq/j2GDOpVxyeAz6CVVQi+
	CoAKVdwtqe7zjab4EBnSouxU1YLyBKbDXFe3ha2+w9bFMWJRN86wNbU87vgxwpyC45UseSitlU3
	HmO6P9aeDYECWa2g+A+LMRJc3Y0HGk3c8sn0QcIDoMENZHbFEV5Zmttg70iRKTAn8Y5wkecxlaO
	pVcRlrrCG16CytnCYZ4h990va8JOJNBgUH/KLl8rja8KVDPN0tOJ+T1NUkQjZLXd1ZBJz1D8xpH
	EgFV1LsCg/7UtpYLreEY84inu3/n8LcH8aCXm2qK3mbzpMbP36xdOYarXRrGQYI3mnhbYaXbal9
	W6s00ZmmOmhPgc+TXTBqsqznMAGynXxDXgz0HdxmaxgSKHLFnRenYQN+snmzFdL983/l/dy3YmV
	I6GuhjD7chsn1yBhWRXM6Rgyx0JBSgcAt/xerQYPr2DEE6Qn2jb69jTnvE72U8oUclm43wR7fP6
	pNoZfnHLpf8bX8FhybgcSHJQsQJD9+sLlGgp9iFAKIJfVPDs/POlBlq3bviiyOGODvjICcH/KRM
	dkYKqpoFczM7ftD7w55lKCbc9mZ0Xw2VBvWbKT61MlBFjw13LDcMTTjUOQqC6+i8Z2EIoW8iAwC
	xd7aCNJCX6DKaomGChUY4rp8rmKE5lOoUNyoGqQ2oQNyIAaXDDaQjVo/4
X-Received: by 2002:a05:600c:a115:b0:4bb:a5e1:74ac with SMTP id 5b1f17b1804b1-4bba5e195bcmr184828885e9.4.1795873139198;
        Sat, 28 Nov 2026 05:38:59 -0800 (PST)
Received: from pc.tail250202.ts.net ([87.110.86.243])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bba6a0d65fsm295847225e9.3.2026.11.28.05.38.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 05:38:58 -0800 (PST)
Date: Sat, 28 Nov 2026 15:38:55 +0200
From: Janis Edvarts Lacis <janislacis06@gmail.com>
To: Antonio Quartulli <antonio@mandelbit.com>
Cc: intel-wired-lan@lists.osuosl.org, 
	Tony Nguyen <anthony.l.nguyen@intel.com>, Przemek Kitszel <przemyslaw.kitszel@intel.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	John Fastabend <john.fastabend@gmail.com>, Stanislav Fomichev <sdf@fomichev.me>, 
	Sven Auhagen <sven.auhagen@voleatech.de>, Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>, 
	Kurt Kanzenbach <kurt@linutronix.de>, Maciej Fijalkowski <maciej.fijalkowski@intel.com>, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, bpf@vger.kernel.org
Subject: Re: [PATCH net v5 5/6] igb: resume the device before changing XDP or
 XSK settings
Message-ID: <lwmb2es2v4j6ec2kha24lk3uxtour2q45fqvjwihl7ik4auvet@jyhouq2ojte2>
References: <20261124235723.1135808-1-antonio@mandelbit.com>
 <20261124235723.1135808-6-antonio@mandelbit.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <20261124235723.1135808-6-antonio@mandelbit.com>

On 25 Nov 00:57, Antonio Quartulli wrote:
>igb_xdp() can run while the device is runtime suspended or resuming,
>and __igb_resume() rebuilds the queue counts and the rings without
>RTNL. igb_xdp_setup() and igb_xsk_pool_setup() can then see a queue
>count whose rings don't exist yet (NULL dereference), or a NAPI that
>isn't enabled yet (napi_disable() never returns). Changing the XDP
>program of a runtime suspended device also opened it twice.
>
>Resume the device for the duration of igb_xdp(), as ethtool does. Like
>the other resumes done with RTNL held, this can still deadlock with a
>runtime suspend already in progress, which takes RTNL itself; closing
>an AF_XDP socket or changing the XDP program is now one of them.
>
>Tested with the 82576 emulated by QEMU by closing a zero-copy AF_XDP
>socket and attaching an XDP program while the device is runtime
>suspended; the latter no longer warns in __netif_napi_del_locked()
>because of the double open. The races themselves weren't reproduced.
>
>Fixes: 9cbc948b5a20 ("igb: add XDP support")
>Fixes: 80f6ccf9f116 ("igb: Introduce XSK data structures and helpers")
>Cc: stable@vger.kernel.org
>Signed-off-by: Antonio Quartulli <antonio@mandelbit.com>
>---
>v5: new patch (Sashiko)
>
> drivers/net/ethernet/intel/igb/igb_main.c | 20 ++++++++++++++++----
> 1 file changed, 16 insertions(+), 4 deletions(-)
>
>diff --git a/drivers/net/ethernet/intel/igb/igb_main.c b/drivers/net/ethernet/intel/igb/igb_main.c
>index acd9a33..80ae03d 100644
>--- a/drivers/net/ethernet/intel/igb/igb_main.c
>+++ b/drivers/net/ethernet/intel/igb/igb_main.c
>@@ -2942,16 +2942,28 @@ static int igb_xdp_setup(struct net_device *dev, struct netdev_bpf *bpf)
> static int igb_xdp(struct net_device *dev, struct netdev_bpf *xdp)
> {
> 	struct igb_adapter *adapter = netdev_priv(dev);
>+	int err;
>+
>+	/* The rings only exist while the device is resumed, and resuming
>+	 * rebuilds them without RTNL
>+	 */
>+	pm_runtime_get_sync(&adapter->pdev->dev);
>
> 	switch (xdp->command) {
> 	case XDP_SETUP_PROG:
>-		return igb_xdp_setup(dev, xdp);
>+		err = igb_xdp_setup(dev, xdp);
>+		break;
> 	case XDP_SETUP_XSK_POOL:
>-		return igb_xsk_pool_setup(adapter, xdp->xsk.pool,
>-					  xdp->xsk.queue_id);
>+		err = igb_xsk_pool_setup(adapter, xdp->xsk.pool,
>+					 xdp->xsk.queue_id);
>+		break;
> 	default:
>-		return -EINVAL;
>+		err = -EINVAL;
> 	}
>+
>+	pm_runtime_put(&adapter->pdev->dev);
>+
>+	return err;
> }
>
> int igb_xdp_xmit_back(struct igb_adapter *adapter, struct xdp_buff *xdp)
>-- 
>2.56.1
>
Reviewed-by: Janis Edvarts Lacis <janislacis06@gmail.com>
