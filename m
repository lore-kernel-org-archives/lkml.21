Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795437789;
	b=oUelLDLhzAS9yLvRyfWNglCE3GVGqBJWuOsZzEwJaOlZ1fIqyRyd8sKHOqdiO+1+9ejs
	 jSoVCPIgHNBHuGZdUaxuTO+pj8j3hRvSidxzhXUQtpCRBNPt3W8SZED14nwwmud4x9fDd
	 777K5oQ87BChqbTbl1YzRunn8poTaF6vAX0bNi+9arv67yEiGaGi+I0npKrZk93kebLqV
	 uUw4XphTBDVrYArke/jdnkjSDrTi814Q7W5Hslc/JG2Av4eKZztyWxDaJuTFRpLL/Dced
	 C2hlEaZcayhNEAhTbGOuryG0MQa+L2zFidqcrLPYIWJ/q5n6QSm1xza/riTNejn97bA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795437789;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:Content-Language:To:
	 Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=4xkXXEJqgLnZoxd90O2Whf+Ji223F+h94sIuB6UxenM=;
	b=vJYu+xN0XyCzmWgbwFOJ38dSXFF33rmsGMcg92kMWehOwpyU9ep7gdv+dhyHC6dsQ5kB
	 r1vIJhCCMmBvQYhSwOdx8zO5FhV99e02QMdJiiRW5x0ehIgF2Cp3cqB5ttOL1ukS8obKZ
	 NkUtOTRHALdT3t1kzogV8Um/eRbuml6jvTJn0EOr7BzNqHn5Wf+5bjMBGVNh/Q38WyJzG
	 EArQyZ9T7QELyqwW1koqANRJT2ZQ/HOeTbmvBYWgJ/uKb3Ai/HWNE62XL6uSn6MfwzFpx
	 r04lMExh86iPdxd8Rggnrvcz/PM7zJdFoRbGwKnUWFqmxVZk2YUG19gmYlSc78fGMEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=blackwall.org;
	spf=none smtp.mailfrom=blackwall.org;
	dkim=pass header.d=blackwall.org header.i=@blackwall.org header.a=rsa-sha256 header.s=google header.b=oAkrxzwW;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4751E606A31F
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 12:43:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4751E606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=blackwall.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=blackwall.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=blackwall.org header.i=@blackwall.org header.a=rsa-sha256 header.s=google header.b=oAkrxzwW
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so41053095e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 04:43:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=blackwall.org; s=google; t=1795437787; x=1796042587; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4xkXXEJqgLnZoxd90O2Whf+Ji223F+h94sIuB6UxenM=;
        b=oAkrxzwW2AC2GeZjCTeqiCWp/cBSSAdEnow0hL04h44Tcn9a8XsDQa2SoKxkvHqiIM
         Tb1LbgZ7g+30rJjB7YHtH0D3e2+vDDxMhIHfZrKW7jcMU7Ml+N/wterxIl1liu8Tues3
         Of84sU862kuAwb8uEo+wGuicYDIGNSJDA+mzQKZVL96sLdnyecIpTWPX0/yK79iCCbnL
         JzvMiAYm6Oaq0p7AlMcXBGTcn1Y7hkJOEsHQuOldkj5++aFxjP+b0aDrzl6pg9Dm+8iz
         Am4d8H/+H1Yg8bAzVlxz0Ii2aNsPvsuFpP8b1NyhP0+wOUvcxllWfdjap/9MTiKGIds9
         q7zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795437787; x=1796042587;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4xkXXEJqgLnZoxd90O2Whf+Ji223F+h94sIuB6UxenM=;
        b=ijRRcSNbCrVdqMmz4mbOIpx3brWrRIotNsvKq2ifE6JbTmaUrDrPBMreJbrd1STStD
         4BHVHqSx8Ye8GhBPyruUzcaZdJ3+QsoX+eG3mnrfgbRsIzcRtyY5dVS2wXR3kKnBPaSU
         PCCcfCXVrcDO99jTsUb1gcr9sTb2iOXF/KanVITqS2tRTiNyzjsua5BfM9qXSNpuwrkk
         RDFefCuCZWtw0DIBFP44RFeeSxAOgBqmg0Nw1vydsbMRMuGu6wsEvRgi79k1r4bjrUYl
         8Ex7AeXacERxCBvxlM8HysXCrCPlNEv1ifx4+FNQADpfrZMO6z50hNF4alRo0fw8ROQJ
         quPQ==
X-Forwarded-Encrypted: i=1; AL+hErEcjf15Su0uPkxky961GRfTNMey3src786moYj9C/mX1/Zu+oEBaEqK3xxUY9f+JF7YFi5/cojZTg2F+M0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/jyL8tP94MnBjEOpBPrfpXVTjSh3vqWCNpuGgb11bsoRegwqke
	bJJqC4jHIDrxAa99pCpclgJLkE+4XQSg+NmRFmE+ZyCdwX7L8nIBoCkShS4ywdjqGNA=
X-Gm-Gg: AZFdTZdzCvbcUmncHFiX+UUnL6klBPxSR9eHVwwDGp+WrNUQ6wfF5O01cb0jiFtxM8N
	HOw2/md9otqDsxexL0kvPFmi8m2JbQOtLce87HDZjSFjIKbHWaRv/tZUEDBFHOP6Rz7Cggl8JEx
	0PC3QKQyUTUsriqeljtizYzv6TkB16bxbPQKIYLkpTLgfFYh9vHj1bfkidq4KNJLrhEkReaGnVq
	4TLNFNKEfKD7axZpClddKVD/MGUFy3QhlPK7fph/Y0IEwQNefSaUbbgdz3Si8fTIsoUhWbT08XM
	I9f0dbbeIYaiqZ//AOo72+Jl+lbTfU7tFVUq9GzjRRegvLFIwEacl4t7CfgqSIWwmlUc+uqXC85
	KamDaQSqpgHFRnNcKHYJY3e1s1PGSVIHMkicA0oTLjWKorGQxb/cDKM0DlKqeiQD1yJUJkduGvX
	isiUEkB4RfvkOEaQVVZIx1fNpe2xPcy/cMJ/FLU035MTzr+UmnqdTR/i3BeowrGtL6CYdFOkwtz
	ncgdHtGp27/vft/EQ0nSbO3fd8EJzf+zFICfBthSVj+owTCG2o0ufWhWgYOadYD9FODN/cu1AkC
	8uWy/TRrbI91NciXQo33I8ITKe6R26HOL5yW5dE2vdpQVtgpGp3NMCvws/++jOYFOAUTcXCELad
	WK97Z
X-Received: by 2002:a05:600c:3547:b0:4a1:c27d:e1a8 with SMTP id 5b1f17b1804b1-4bb8880b88fmr227420305e9.10.1795437787370;
        Mon, 23 Nov 2026 04:43:07 -0800 (PST)
Received: from [192.168.0.161] (78-154-14-127.ip.btc-net.bg. [78.154.14.127])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906c089dsm170500135e9.1.2026.11.23.04.43.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 04:43:06 -0800 (PST)
Message-ID: <9a533d71-7c7f-4946-9f5b-444db8737547@blackwall.org>
Date: Mon, 23 Nov 2026 14:43:06 +0200
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
Subject: Re: [PATCH net v3 2/2] bonding: don't let an 802.3ad slave change its
 type
Content-Language: en-US, bg
To: Kyuwon Cho <kyuwoncho18@gmail.com>, Hangbin Liu <hangbin.liu@linux.dev>
Cc: netdev@vger.kernel.org, Jay Vosburgh <jv@jvosburgh.net>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 linux-kernel@vger.kernel.org
References: <179535729502.2645501.5219010464870440@gmail.com>
 <179535729502.2645501.271186140389290426@gmail.com>
 <20261123032537.GE10218@Liu-laptop>
 <179540710966.3093990.1416762538136490909@gmail.com>
From: Nikolay Aleksandrov <razor@blackwall.org>
In-Reply-To: <179540710966.3093990.1416762538136490909@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23/11/2026 06:29, Kyuwon Cho wrote:
> On Mon, Nov 23, 2026 at 11:25:37AM +0800, Hangbin Liu wrote:
>> Hmm, I personally prefer the approach used by vlan and team, which disallows
>> changing the slave type after enslavement. If you think we should only disable
>> the 802.3ad-specific part, this change should be merged with patch 1, as they
>> address the same issue.
> 
> For net I would keep it to 802.3ad, where the type change leads to the
> out-of-bounds read, and merge it into patch 1 as you suggest. Refusing
> the type change in every mode would also make the enslave of the nlmon
> device in bond-eth-type-change.sh fail. The test would still pass, as
> it does not check that enslave, but it would no longer change the type
> it is there to test, so that change seems better made in net-next.
> 
> Nikolay, would you rather have the general check?
> 
> I will send v4 with the two patches merged once this is settled.
> 
> Thanks,
> Kyuwon Cho

Since this requires purposefully breaking the bond with CAP_NET_ADMIN,
I'd go for net-next. About the general check - unfortunately I don't
think we can do it at all due to one, rather weird, use case that comes
to mind - nested bonds. There are setups which use bonds of bonds and that
will put ordering on the setup, potentially could break scripts.

Cheers,
  Nik


