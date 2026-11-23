Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795445919;
	b=zDdjNIfXe+YUDWUtz3cr0IX+D2VfHrm1qbVbVOzaNKz1yHLrZG41dLR57WnNkFJhaRcc
	 4aWfnLeT82XBhs0APmWTtOnLGQ/d/5RfOZTvGRTDPbxQAh5Fdb1lsJbjL6tc1kZ0vriUV
	 Cft6JL1n0Q23tEtZNAPB4TNTEO2kIEC/0kL0uU2ba4Q+AedckD8NdZ7yzy7wwIBvijtfJ
	 L/TGg7dVks0ULpJ9YXo80zNGSwI5cjpTjV/uxXXXSgn5Tik6cbZGJhW/bvb4qLamo86gU
	 XRSP8WoL9cjy6xGkUpDRDevB1WWawcDnQ1o1tSTm2Z5OR5eMCT2i+6a6M/9RtDo2B7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795445919;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=ZQvS7z6b0AGal/0iSKLTcxhwhRK+gpszSACJINCNrvk=;
	b=wL4FqUV8YdUNm4fNogeIYLYUYVMkQjbpkaUuOOeNjQm1G9RGWVTGp/h7A27+y42aQRP9
	 F2C/wHHsHeyBQDDUeXVhI+/0sVVtxBmkX3GpgiktqsVIMsEWXhaSrSPn30vwoDqmhri+3
	 shnTlkD5qkISyxVXexBhxFC8unWyej2oo5gS1fMwEEp/0F/q7pzCP1o0RrAffyTL+QAFR
	 ZZl+1kLa9FSjjcQAqYi3cFVhOck510rHcOOCgLbveVtjj4DVkhexMU0rNheGD5aaoZkyf
	 natBnrAlH5k6GKGujD4FN/kj9iIrTDuM5bHHPi6HIZp8sWblZdjQCwKMmF9eDImLUbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=anKXnO0N;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=LM5pEx9X;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 711DA606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 14:58:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 711DA606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=anKXnO0N;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=LM5pEx9X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795445917;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZQvS7z6b0AGal/0iSKLTcxhwhRK+gpszSACJINCNrvk=;
	b=anKXnO0N2W9sMKqDN4tZKsgxjnrO7vf2kg5z7ITBfn+8E4IabNpxWI3GGWE6btVoTVVxHX
	xttlfXMkxUhpYlR7f/lkap5LIOSsVsuV6kRLXx07rLDBb9JzxsvchbyP+Voinw1oOwvlrQ
	LhzG0/TkcFb87AHPUjMiFYroi9NbpQU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-88-P3Kbmg1RPYOrRKEeMcaKyg-1; Mon, 23 Nov 2026 14:58:35 +0000
X-MC-Unique: P3Kbmg1RPYOrRKEeMcaKyg-1
X-Mimecast-MFC-AGG-ID: P3Kbmg1RPYOrRKEeMcaKyg_1795445913
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-49953abe51fso23612125e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 06:58:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795445913; x=1796050713; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZQvS7z6b0AGal/0iSKLTcxhwhRK+gpszSACJINCNrvk=;
        b=LM5pEx9XH0O/dMDqIT/nDZ+yH036ZgtFkFTZ0sg9Fbkw//noqGopspakB6mTlKYTGo
         OTBZ3f3za/z+tSf4px/M6sM1p7dr047P/djP3hY9p/5j/a7sbPAGWTVXnSjm/i9lKE48
         4lMBaCjIzl7c+CEmyBRRURLBuR5A/jomPJlxp1DnQmeixWyvgqd37eF59YwNWw19tRoG
         aptp8gov7UR6WIhcVLZAjJ0zVkM3bw0WpNOwmTAYpjNfP+YpJJK7TMJyz4lN8Hrxd+Xt
         Ou4frgDTFzlg6yTv/c6ggWDRVfrKLULEMR7De7iceHSALxg2sIS8mBNs3YprkOz3B6FR
         hUtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795445913; x=1796050713;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZQvS7z6b0AGal/0iSKLTcxhwhRK+gpszSACJINCNrvk=;
        b=etYwxFSnG6rDDKiH23/o/A23l0Odu80ra5ybT2/OcT99HsNDYJFC2ERzqSTGrh2BW6
         8mLjsvX+H4BI40K87v4ugzs/tA21CkE+/6TvP/bSHCHyA/lo8fAwASzA4CL0nsiqe9WT
         DbiXK0Z2do3Krtuzg8XEhLSX2ilMiKvfBpXswoecv/ZBtB8sst312hBY3/p2454CL4Jc
         t9CsgorS06MZm2RXR1KeM0P2dvPB7O/GfgvUznsROJbodOjiBlJ6Gv5n/SCbT11r8By/
         kbr1w44ZXA5fBVyoMJ9QaM8jq9ORzkU7E1aAWjN9agTnbMRNGYjmw5dwClV6BV73xe0Z
         n4kg==
X-Forwarded-Encrypted: i=1; AL+hErGSBp39qyRRBJYuACkgkdb17PeBa2to9VXD3WWXjbJoxHBGWZ12jwGXm9Aas9JHHEB8yPAxk4eavurwyPA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9CjXI3kzQvDqSmGMcEonf2TAsL9xjoAblxLQ5m4+UaoOenFVkF
	zM0bvgOLaZ/xfPrx7zLTxqNW8uJchYqC59Wt+bOM0sKqs8pK7jOHdO5B6v58+ke88usWHJvym2Y
	i3pzKM0yFmpAVWdmZHSZJC64PSBdqMUkbnBPZAzXO4m4xIcTtpOzFK11adt+yCrDpWQ==
X-Gm-Gg: AZFdTZflj/EP3a99c3qdQ6awh8z0BW49e3ZL9gSSfeESHPzD04OcOms45js3lmy8f4v
	Q0nOD014jh0B5AUSIdtq7a4HURa+OV6kSMtEMPS8fas9AKMaFx4AYZUUn2T9WNIFvhbXe88FEVX
	Z10Rfa6cVcXlGuhwWE5bZVp3H0f8/pBXnEnJBuRaDmpwWUMMik+ML9yAPSKlgDD24n3zBczIL+l
	X2SBIMmrTVUL4XnFOYjGH5rWmlO5sKDaRUIi41kme33MSWKTsuzB2FeaZqV0pPYyYfmrPWtUpD7
	L4VePwSUWgygIGBHhZk6F3TJ4Vypsj+lJs8p9Zd2sMULxCtjk4O93GillcdDN84ncmV2ALZK4RU
	J0nEcyErURO5+oMYcNCrrDYYO3Dl+Z+M/63QESCZjnSCTgXQUUwfdZlb/KfaklDscCL5Ie4IT4L
	dHL2YZc2kpDKP5x18ffxzxJIIGqnNfPlK7Kxmg2QExiUsX
X-Received: by 2002:a05:600c:1c1b:b0:4bb:87be:c138 with SMTP id 5b1f17b1804b1-4bb8893e021mr266098425e9.32.1795445912676;
        Mon, 23 Nov 2026 06:58:32 -0800 (PST)
X-Received: by 2002:a05:600c:1c1b:b0:4bb:87be:c138 with SMTP id 5b1f17b1804b1-4bb8893e021mr266098035e9.32.1795445912294;
        Mon, 23 Nov 2026 06:58:32 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c248b75sm23206193f8f.54.2026.11.23.06.58.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 06:58:31 -0800 (PST)
Message-ID: <15ef5667-23d6-4c8d-8cb9-ac3853677c81@redhat.com>
Date: Mon, 23 Nov 2026 15:58:30 +0100
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3] net: sparx5: check DT port reg against chip
 port count
To: Haoran Wang <wanghr2026@mail.zgclab.edu.cn>,
 Daniel Machon <daniel.machon@microchip.com>,
 Steen Hegelund <Steen.Hegelund@microchip.com>, UNGLinuxDriver@microchip.com
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>
References: <20261118162156.17688-1-wanghr2026@mail.zgclab.edu.cn>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20261118162156.17688-1-wanghr2026@mail.zgclab.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/19/26 10:46, Haoran Wang wrote:
> From: Haoran Wang <wanghr2026@mail.zgclab.edu.cn>
> 
> mchp_sparx5_probe() reads the DT ethernet-port 'reg' property into
> portno, which sparx5_create_port() later uses to index the fixed-size
> sparx5->ports[] array:
> 
>      sparx5->ports[config->portno] = spx5_port;
> 
> The value is never validated, so an out-of-range 'reg' (runtime overlay,
> corrupted or attacker-controlled DTB, kexec-supplied or bootloader
> fixed-up DT) turns probe into an out-of-bounds write.
> 
> Skip port nodes with an out-of-range 'reg'.  lan966x_probe_port() has
> the same bounds check but fails probe with -EINVAL; skipping here keeps
> the remaining valid ports working.  The bound is the per-chip port count
> from the match data (sparx5->data->consts->n_ports), so lan969x, which
> shares this probe path and has only 30 ports, is bounded correctly as
> well.
> 
> Found by a scripted scan of of_property_read_u32() call sites used to
> index fixed-size arrays, followed by manual review. Verified at runtime
> on a pristine v7.4-rc2 arm64 QEMU virt machine (inline KASAN,
> CONFIG_SPARX5_SWITCH=m): an out-of-tree module supplies only a
> malicious DT overlay, the unmodified in-tree driver performs the store.
> reg = 15839 yields a KASAN use-after-free, reg = 0x20000000 a wild
> write 4 GiB out (paging oops), and reg = 65 silent in-struct corruption
> with a later NULL oops. With this patch all three are skipped. The PoC
> and full logs are posted in the thread. Not tested on real hardware,
> QEMU virt (cortex-a57) and compile testing only.
> 
> Fixes: f3cad2611a77 ("net: sparx5: add hostmode with phylink support")
> Signed-off-by: Haoran Wang <wanghr2026@mail.zgclab.edu.cn>
For future memory: please send new revisions in new threads.

Thanks,

Paolo

