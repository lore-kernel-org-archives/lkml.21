Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795013278;
	b=IctOanLKsZMpuPDlAhkgVYABCleml1NMask3USAF8ia4wfqyut2Vd4/6y9q5JXBS6keS
	 LsO8oI+zZtf46zZMQdPMPmKA9xFNiZ4ewvz4qbSd4ILsJ3jG2cE07nMy8cm7f2KJjO4a0
	 jhy04ALQ0dY+sd20Fvg/Tl2EShinUg1lVERG3ZeetB/V1nVNnRx8awaWZ2SALMPa/W/kD
	 MrzphXWayUi6DtwBsa74ULlnsTlC6DuhniifoLdXpR0WTBbLuaW5F8VshxA5/fj9c4Aeu
	 q5VRhiGw3RLO4sgAEwtx3ysUmfG4Djo9u+xCdZJ1O96tO/+3eclCIAybXZG+ZWzUqKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795013278;
	h=Received:DKIM-Signature:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:Content-Language:To:Cc:References:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=p6ch9PufS2qq2asSKyMj/8t3wPwb7e7/cKHTuVos4cc=;
	b=JJHMLh2UXkmNlMGkmD5YZhKiEsqcDMWcJjDWDF8rXI5hOSFiUa9TFU0hcOlrUgkUznA6
	 Mbs/GvdyIAQaSk8tvIZImG8rFroylh4S1e6QqQr8G2Qpyyv9oujN4mGiqoIJWTK764J+h
	 lKwnTFSpas+LN3GWvW9EiAbiVd7vyDVjdBqCIzXo6cnVsue2DLJM15IBSqa3+uiy9EE7S
	 fEYVc6gNQO3RKPi7g0CYiL8PaqUclZQPItspjo9CDcN5neFx5OXOltjEvO/WnwTuQJ9E5
	 b8F4zuXp+NbSQWq2ChEkyjTLQZNS02ZTXZK4k+rbZf5ZSfmLXPFTggEuHUeXnaTp1/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ocWCNjeb;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDF37606A330
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 14:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ocWCNjeb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 045C71F000C4;
	Wed, 18 Nov 2026 14:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795013277;
	bh=p6ch9PufS2qq2asSKyMj/8t3wPwb7e7/cKHTuVos4cc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=ocWCNjebQq8quf0B4+i8VUR6UyW4jbL1+00GkGmI4f8QpGA5uyCCnlOHgesHXEZdB
	 Mr6mesG/DS0TWFFZbRAUBsPjD7d9XaSLkowrU/jDvRdTI6WUi0Zp/hXbhKz8zpNxiK
	 opVa2HqgB2hMXO//0bn+x9ywcVUXQLaa5MSJTqWqTGvZ65d+++QrPsWEmCYJmSw5LL
	 lMceAhu9FC2Qb2YOoMBscGV7MZSh1ODXoRbOzvf9VjnjNWhtVyFUtnwFnDn58TeV8E
	 BbbufrP+regTX7VPG+CEQCX0yaJGtCEyBgOh8C+Qb2LinNgSVfZO1q3vaNmPhW7Dgv
	 vxRgR+4Ek8owA==
Message-ID: <0fa7900c-515c-42bf-9f2c-aa14086e4790@kernel.org>
Date: Wed, 18 Nov 2026 08:47:56 -0600
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
Subject: Re: [PATCH v3 0/3] lib: Add software mul/div helpers and use them
 from nios2
Content-Language: en-US
To: Arnd Bergmann <arnd@arndb.de>, Vineet Gupta <vineet.gupta@linux.dev>,
 "schuster.simon@siemens-energy.com" <schuster.simon@siemens-energy.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Sasha Levin <sashal@kernel.org>, linux-kernel@vger.kernel.org,
 Vineet Gupta <vgupta@kernel.org>
References: <20261110-nios2-remove-usage-of-libgcc-v3-0-1449ce37948e@siemens-energy.com>
 <69073cae-ced9-407d-ba96-e55fc7635735@kernel.org>
 <41664890-337a-402e-895f-376c941d83f2@linux.dev>
 <204a32bb-122d-40b1-88f1-73fd2a6f4b54@app.fastmail.com>
From: Dinh Nguyen <dinguyen@kernel.org>
In-Reply-To: <204a32bb-122d-40b1-88f1-73fd2a6f4b54@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 11/17/26 11:08, Arnd Bergmann wrote:
> On Tue, Nov 17, 2026, at 18:05, Vineet Gupta wrote:
>> On 11/16/26 5:19 AM, Dinh Nguyen wrote:
>>> On 11/10/26 09:58, Simon Schuster wrote
>>>> ---
>>> If there are no further comments on this patchset, I can pull it in?
>>
>> Sorry got busy. I will test this for ARC tonight. Also can this go via
>> Arnd's tree - I can post a followup for ARC which uses P1 so everything
>> can go together. Or he can a stable tag or branch of yours, whatever works.
> 
> Agreed, I think it makes most sense to go through my tree, I can then
> also include the openrisc patch on top.
> 
> Dinh, if you send me a pull request, I can merge that into the SoC
> tree and you can keep the same commits in your own tree in case
> you are worried about dependencies. Otherwise I can of course just

I have sent a PR to soc.

Thanks,
Dinh

