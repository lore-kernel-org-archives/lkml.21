Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795026452;
	b=nRebe0NdkhWLY3hlAfLyipc3niLnKfGDA0NUCk+mCqIBYsfWulY2VEB2qwthZOj5DxK9
	 ZRGuOgS99su8EukEKM9oyj0+kkDpZBfVTJ1WbmPm5RJLm45xhSrmh3w46swrtfcheXWPP
	 scVgX0RUUKqMUKSD5OFyOnYMhgHhDFUntGPRur3ZwcoiSkeh8rxCdqlIBBIKAVpKBJCSJ
	 N7FPZmMI4P6bildsNZkU9PJZg4kG4TIKZDwjLFcooZAOLQPyOSlqTX1nQ3lGGV5KW8e1P
	 sENl+YRVcdQQXw48DUXwtp+06hxwHbX0rG9OdS7/LrWPk9t+M/Of4IxrVY42x9qNlLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795026452;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=wA8d5hIKD/CZAR1awD4PWn450Yh0Q+o9r3zTMlIDXBg=;
	b=U78oW+FWwvUPV6/HzujicNy+OkqZq7q4RUXxabuBX1F4jiaShiseUoxAdxNNT0EJuusf
	 fRo/o4od47T0PkJoP6IvGdtRGOqxWsgxj7eNI9Mela/AU+O7oSIYDav6NUlnzu73md0ui
	 OFhdhj/Jogm0jTFziM82wxpjUAJwncdrmeIO/7e/kuFDfFdSm5H86JKTuzblR++sQo+wx
	 daxrVKJpAquYgsH12Mn6pE2v1CraN4Ept7OTuq6po1vNPiezZf8rtzhPg6F/za2vAwEug
	 VmpGn5IVytiSHBTQOj22D8oU/N24ELfQzRgGQESzAQAu0s1z0DL/acGDpwIFV/jH9dQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=networkplumber.org;
	spf=pass smtp.mailfrom=networkplumber.org;
	dkim=pass header.d=networkplumber-org.20260707.gappssmtp.com header.i=@networkplumber-org.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=fWLxt5LK;
	arc=none smtp.remote-ip=209.85.215.173
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F19F2606A333
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 18:27:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F19F2606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=networkplumber-org.20260707.gappssmtp.com header.i=@networkplumber-org.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=fWLxt5LK
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cdb2e0062bbso809093a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 10:27:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=networkplumber-org.20260707.gappssmtp.com; s=20260707; t=1795026451; x=1795631251; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wA8d5hIKD/CZAR1awD4PWn450Yh0Q+o9r3zTMlIDXBg=;
        b=fWLxt5LKpRKB6ATNCGiw0SEiTlhqfpY0nRBIxcf4uyAkzC1/jXTfIQ4edxPNrV+d48
         Ped/CbpqPrS/U773oNQX5mHaK3pZd2moxMsxWuG8ZKzLypDR6kfC8mX5E/U5V+a5P3T/
         RZCd85yxQMF+y6hC0Nq7vdhDxkVBJg9s6Fi3M1PJWTGv01CGzaSdqA8F9djuxTeR7u7+
         TmoFOiVE8/z61eC1CcYHbTqWanWQHdHcIPoeyy+HyojmMM6NoRpZoYFG0owWUUrxMGr8
         QB2+nrAkTSrI5WZeDQWKZYekHHsWja9lX4ngTMSfqtp61qC44FxSiLwV3j6lujGVCy4A
         lzDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795026451; x=1795631251;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wA8d5hIKD/CZAR1awD4PWn450Yh0Q+o9r3zTMlIDXBg=;
        b=KzU0AfOaYnlGILoZ5EAcHww3y9YrkpBkhRsekshVWpqC2FSAiPr5w7ghlyz9ApLr5P
         H7DVnV0tKQuy10Wzvro4BFZK0a2+U6yJhVswo7kYiNYOHd1gQp6CueLEjeHzRO1MHpEg
         3BAbQO/o6mq/i3JAudgWwIXkDmEAagTxP7HRIC9XJhFnfB1us6AMyi5PNgQTeZVon3T0
         8v/jm/AqDAhneybMZsVoMqYfq8HKtK8uC2CnqZSbtplVuHex4zfmJ18zsX9WBeDoVRCW
         29fP1KcbtmxyNgHUEIgQ3n+ZY5uygO5858TbEt9orsHpVsBhTnxsI7ju1Dp6bz/RA+Hx
         YfAQ==
X-Forwarded-Encrypted: i=1; AL+hErE6CaDTnu7F9+Wt54zDPsmUR348XAj2i/ndlKZimbY8ZxmSXS9hmLgR1pA6e1ocJmL4GtgdORtY+fTjCkY=@vger.kernel.org
X-Gm-Message-State: APuU4Z/WVkIO5eTcu9G+jliL4Wjihh4FrhkD0XTtKdNEzNJJ7/esCErc
	zSuQZu+TnpmHWyOWIa0a7Rypx2ueKU2r8C0yr1jGe670l4UJT9FozqTBy8hFJAsm6eA=
X-Gm-Gg: AZFdTZfMTOzD587VrIHLwNpVTNNRCZ81O1wB/OFH+YoZo5xeMIigJqvAgDr6qtSb0Ow
	jphnrEkyBmfSOe2M984UQCzbexviS7dbbiC2ETs0p72SoweK+X4uxJkssbb+AtNLn8YxJ/C5k+Z
	1pS085/QrG9NcvL0UHEZg9xkLFe7TI0g7T9pwV2nEoxjtpoNhiuYEfeYPOYUJThwgv3PxsHysZ6
	OJmyg+Q+ep/+tGGEIm2a5NUFdeJdZKj15t3VZHXjgRKXWTRAk3Z4Tuq/tyNNfLgQIJPiyb+3rGm
	VtrzIUvLZ7RGy3yDW3xkkxSKa09bmZ+8sjZB++s34Ou4TnDpVF2Q2NA0JvPzELAvSW2+/wy7c+b
	NSO/BxVqG4UzqZELprp/jrjgMC74qUitOQW09yWYHK6o5fRJg999ua+4uUmwke/8Ryfdmmontcq
	yq+dELI8srSqmKM6/Xkpgoq6yv5FEplfWw0CnFB4ib1sAA50+0UmaAvvaRcjmoDEMAaSnlS/N4f
	+5JpeGiFkDo8j3LcFOcLM3TyIo1e5ImZdj7GRD3RdVeRa72JaNLBsUPdDNbFvj/Em6M55LiaxHB
	b0qD2IT0Et6rXU9/YZFYqRjB5HpHusOO+gAQNz3e6UHyAN7R743zVL00YRSFKqgtzcw3a0xkCfz
	P2gDiLQ==
X-Received: by 2002:a17:90a:d445:b0:3ac:8897:7bab with SMTP id 98e67ed59e1d1-3b3d0686792mr3137248a91.6.1795026451247;
        Wed, 18 Nov 2026 10:27:31 -0800 (PST)
Received: from stephen-xps.local (c-73-96-252-35.hsd1.or.comcast.net. [73.96.252.35])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3f6c15c3csm411408a91.17.2026.11.18.10.27.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 10:27:30 -0800 (PST)
Date: Wed, 18 Nov 2026 10:27:27 -0800
From: Stephen Hemminger <stephen@networkplumber.org>
To: Hangbin Liu <hangbin.liu@linux.dev>
Cc: netdev@vger.kernel.org, dsahern@kernel.org, Ido Schimmel
 <idosch@nvidia.com>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, Kuniyuki Iwashima
 <kuniyu@google.com>, Sabrina Dubroca <sd@queasysnail.net>, Andrea Parri
 <parri.andrea@gmail.com>, Stanislav Fomichev <sdf.kernel@gmail.com>,
 Nikolaos Gkarlis <nickgarlis@gmail.com>, Willem de Bruijn
 <willemb@google.com>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH net-next v3 1/3] rtnetlink: return EMSGSIZE when first
 dump entry does not fit
Message-ID: <20261118102727.3fbb89ab@stephen-xps.local>
In-Reply-To: <av0HEABXXzKVNnoU@fedora>
References: <20261117221538.184948-1-stephen@networkplumber.org>
	<20261117221538.184948-2-stephen@networkplumber.org>
	<av0HEABXXzKVNnoU@fedora>
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

On Wed, 18 Nov 2026 10:01:52 +0800
Hangbin Liu <hangbin.liu@linux.dev> wrote:

> > Fixes: 5b4b62a169e1 ("rtnetlink: make the "split" NLM_DONE handling generic")  
> 
> Should we keep the Fixes tag or not for net-next?
> 
> Thanks
> Hangbin

Yes it is fixing a regression, though I doubt any user would bump into it.
The commit referenced changed userspace API behavior
