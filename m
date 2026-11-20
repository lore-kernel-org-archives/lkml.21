Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795188551;
	b=mweVfLiZg6zXzpgi8zKIroni989sY52AOCMAbCwMd6lDGPfUQ7HWmWOEW3A9ZPq4xQbW
	 YWdEIA0pzIgOwnnWQlRH85Jiw8Ps4Rp+5AkiqOUt2lfcQnDCeyiGpfF7jrKrMeKcByYG5
	 verN4PoKshsVXUUkju+PZPcK9S0CXyJQR7daQr17UN4nqWJ5kYRjhDG6HbqZ+DvV7awv8
	 bagSaZ4jVTmjbSJldQ4xk6swUZTeE4TUzmwBdlLgaO0w3YnYZae8Ns7leGwyzcGXBQfx1
	 MMd3c3BgEw3DUdKTWF4ogYkudbfumVFtfeR0WgpOGAG+xFiYkjYB4G8E8SK779G9G9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795188551;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=Vhu55Pzlkvmu17gxKyXMYj6pL0x4NHh7A+EQNL/WuaE=;
	b=Gx2Fa6TVO+GhnCX38mh8FHKA1uPcjYodgzTrD+0tBOblW7vMyA/yhxrDJKIEgIWefYRc
	 FAlsflniFWEN4BUtGlKSOYTmkkVUmA16VTweL0hFRGda5eaAZXN1TPXK2IE9pVnAAuqC0
	 GOnblsal2dITu1PeoigBRwl1cmMD+Fi4AXCe+vJUNH3hsb1wxcreTSjVGP1WGfdaNxEY4
	 5GVimeZh5FBY6wwWVPqDZxZQW/f8+dhC7Owv+kFJzcdOf4f5Q2TK4mqascON7kbNwkEbA
	 rZVg/fU8ypcFdRP4vJ5zBpTJ0u11cXdgcLpBcZKESPQEBcksgNId3pOhFGqIvFV4LJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=p0Wd96+k;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50BA0606A325
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 15:29:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50BA0606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=p0Wd96+k
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-3712b6d9843so966748eec.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 07:29:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795188550; x=1795793350; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:message-id
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Vhu55Pzlkvmu17gxKyXMYj6pL0x4NHh7A+EQNL/WuaE=;
        b=p0Wd96+kVxO+guCcOLTA3P1aCqsrboHkh+kTSzEiBzZoMdDWNL0IRclccjhpyckfJc
         IXqF28qsDzGOX/9JY7UHAt4q74bcsiQ0x7gFASbjovtNoLbw5fquBA2d5iKHOIqnQb7L
         7Z817vRmIL2yC5utzdLG9IHGb0Jxkzo/J9/5j45bPHV+AErU8z5xGVT9o3HMEWUbh1ox
         552R21qZ7DloPUa7b7ZBtaQ9Wlh+V1ktcaoCdp0f03BdArzZys+GYap3o87DTiHuOuwY
         a8NrC+yNrQRHhv/T4rniZThQNDlywp6xKUSlWJ/h4GMisQEHQNi0pzC6DvmqFq7atwQe
         Ircg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795188550; x=1795793350;
        h=mime-version:content-transfer-encoding:content-type:message-id
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vhu55Pzlkvmu17gxKyXMYj6pL0x4NHh7A+EQNL/WuaE=;
        b=f23IJe2l8hkVQroXqAjkTimyNHKEoASYMIfpKm//2HyETnKiDgH0iLSNUtR6vaW/hi
         c/LF9RVClseaHmeoIkVvL3IxAHjezI33CpdDTm6NUWyOzdYJ1vUais8aODxn6YzvI0Wn
         LaZY+wxE8KM+u7HQVhFxrnIJXAoGE/aWoo5JmXskjlPbPdNRuikzdvKItY+x6w8l5BOs
         82PpPkZVqxXA7l3Y1TjOmu0WcylddlYfA+stbM9ELnWcy3ErKl5x8/eIqQG0MZyQCb1M
         9IiCJ3wm/OBHd8VcQrp+X4usLfonUunJ1/pm4qLc+b2NWMr7OU8CQoXf0osNWeOpKKR4
         H5CQ==
X-Forwarded-Encrypted: i=1; AL+hErHccAraFbd8fnz742aPJCyK7RnwMnaqJ5XAahoEeF84wVzdOhXW+5plgf1yRCXs6/48m4cWIif/EEoE1JY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/kfVAB/ynUMkuKpzJYYUYKVuHzzutInoV+FxRAVwpigl501aua
	J7XtsDuheRz33AklzopyJkruALM56gjwik+gzIUf5RsuKp68PXLwoWsz
X-Gm-Gg: AZFdTZd9rPCOLgw1NC/lJoXG1jHJtchsvOO0Sk8ZBklQ++ZTSLB8mBwIrPG/NYfj1j8
	5km5gbhqqgAonScLeSmTsWNhFMVcj/0BovnqS9pTa6ZUlf1nc8ll8ea4wvfLsK7pmMAJxakQg2e
	/7xAqmQJErz7PN7roskEAjI8W0ZLTiJwJFmUTf5beiR2XUguunwULWNsyJeLsBQY40EHALfBebi
	wcykuECTGuPgMobYVrTxN7G50Xr9pyVWT1OLxyNk/sYdcDt3/dXcXnrb4MNG2bHp/60TF4m+oF3
	1hCXb68sZaIm3WkU47tP9r0penGHLr+M15M0TX7SEHcnOGsP3+VBlNYaERKz6vYTaatIG+Lf2tr
	Cz7+GXUEWvdFM3uYqadFk0iSZebiRZ1SHKaY2PEO55bMg+u37Rurec8WpXOOKwN4iqebYsDi7il
	LaA/Chhbn5GxKy/EcLrDh/Ornk1tPAj6i29NXHH7EghyQI+6R3MQCebCqYo13NExe6zDnFUq1N/
	69ccMSxOs65EN3U9lnMKC+8mjZEZ8VtF1U4vi26MfvqzxMaio81lZHQyqQiZNlv5gPe9Xk=
X-Received: by 2002:a05:7301:4309:b0:385:fa10:ee3d with SMTP id 5a478bee46e88-385fa10eefemr1888740eec.19.1795188550101;
        Fri, 20 Nov 2026 07:29:10 -0800 (PST)
Received: from [172.21.0.2] (vldb.skku.ac.kr. [115.145.173.180])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567abb870sm7705635eec.25.2026.11.20.07.29.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 07:29:09 -0800 (PST)
Date: Fri, 20 Nov 2026 07:29:09 -0800 (PST)
From: Kyuwon Cho <kyuwoncho18@gmail.com>
To: Hangbin Liu <hangbin.liu@linux.dev>
Cc: netdev@vger.kernel.org, Jay Vosburgh <jv@jvosburgh.net>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v2] bonding: reject a non-Ethernet 802.3ad slave even
 when the type matches
In-Reply-To: <av7JE91kbL3gf8MS@fedora>
References: <179505868590.3571070.12381528230330714812@gmail.com>
 <av7JE91kbL3gf8MS@fedora>
Message-ID: <179509928313.4181850.1728907555340063150@gmail.com>
Content-Type: text/plain; charset="us-ascii"
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

On Thu, Nov 19, 2026 at 06:01:55PM +0800, Hangbin Liu wrote:
> Hmm, should we also check and set the bond device type back to Ethernet
> when set mode to 8023AD?

With this patch the leftover type should not matter for 802.3ad: the
mode can only be changed while the bond has no slaves, every slave of
an 802.3ad bond now has to be an Ethernet device, and enslaving the
first one turns the bond back into an Ethernet device through
bond_ether_setup(). I checked that on this patch: a bond left as
ARPHRD_TUNNEL6 stays so after the mode change, becomes ARPHRD_ETHER
when the first Ethernet slave is added, and comes up fine.

Resetting the type at the mode change would also make an empty 802.3ad
bond look like Ethernet, which seems a reasonable cleanup, but it
changes the device type outside of enslave, so I would keep it out of
this fix. I can send it separately for net-next if you and Jay think it
is worth it.

Thanks,
Kyuwon Cho
