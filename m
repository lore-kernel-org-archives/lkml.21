Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795184339;
	b=h5tUg4HVX7EoHaSxO7vPnNvXegtc9wsQ6MqSF0ADbLJwJiWVkPCcGsnW8uoFmMun7P07
	 0xIAUpZ67uH5MXHhrA/hjJxQlSNQX0H/2RP+X/MU4/n8+GDsvE/2LQnzspLgSsZczup0T
	 R7KA4gVYtoYo+jHB6xbqhiAEVXkcKU7+Ii6MzuXoYcr8efUCMT8m1g6Dd73lqOlwlm3/y
	 ox7j89ZepoY6uDZ/9+nICmuiUu6tTPk7RrLjMHYa61cVZw41q2AHHAgvczgPbmBEyv3vw
	 evRnBqvVfaQNcDxoW4iDv5gxLzMaZcBMywud5fsXdeouNrtFfl8bIbDkvWWL4TKmNmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795184339;
	h=Received:DKIM-Signature:Received:Received:X-ME-Sender:
	 X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:Received:X-Mailer:
	 MIME-Version:X-ThreadId:Date:From:To:Message-Id:In-Reply-To:
	 References:Subject:Content-Type:Content-Transfer-Encoding;
	bh=Poxg2dNbemwElRcsc+guVsxtMBqsLvr4KASlDji/qhA=;
	b=tiyIE3oalowZr9S2dczfHvNiCI30gdV3h4gWr/MsQEIHHsTDC1FH+jT4ViCpERvcGNMq
	 Lb7sp2Eov7rKwj/ulG/QHtNrjc2ok1I3symJ/Q0jd3kVSQKWcBkNngqNzDwspvhbCwwa4
	 JBEZPVknEz2KCi8+qlyPCFeifDiresIMaRNRuVpxhi2CChW8smbu+jKlxwsHtgGrl9dkx
	 JLJfnrAIZ7zKMvKcHfN2IS+tarrb1G8x31J2jUogfcOfB3mlqir202NAoDv+fgbRxSC9A
	 IQZcBjwZRdzLrorZ6GieH9Y5w6ZCX/0RnTjoq3+NbHUMya7LTqeo3KNaUeYtyC6SKwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="eyxudgy/";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A6FE606A320
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 14:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eyxudgy/
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEDE31F000C0;
	Fri, 20 Nov 2026 14:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795184339;
	bh=Poxg2dNbemwElRcsc+guVsxtMBqsLvr4KASlDji/qhA=;
	h=Date:From:To:In-Reply-To:References:Subject;
	b=eyxudgy/ysxAxceFz08zE9ZACdlUIM0IcgM9abKuScKy5uOHeOQZT0lNHv2jJt8Ji
	 Hv54sfK6qRH3gcuiQsaumghSz2gOf93CVjrsgWRyWHPSNYs9WSeBt1dUY/dSsSG8f7
	 WvfgTfLmTpA4VGly7ikTYCenKbDAwo4qSAR2cag5nejcqebNPcqajsWE3tadia0vUe
	 dum6SUuCQ1quW2XCznFuKqS5LKorVpBwIMrSGOOu1j1hKRTSLspN3WZr+ZoQ0/SF7h
	 xFcPF5U15vMsIiKXIYk8jQ4vp97/rBLrqtEQoq2J3jYVs0Ez789qHq3CqcqaocNr1V
	 0/qdoZKVgy0Gw==
Received: from stl-compute-04.internal (stl-compute-04.internal [10.204.2.64])
	by mailfauth.stl.internal (Postfix) with ESMTP id 4BE02780043;
	Fri, 20 Nov 2026 09:18:58 -0500 (EST)
Received: from stl-imap-13 ([10.204.2.104])
  by stl-compute-04.internal (MEProxy); Fri, 20 Nov 2026 09:18:58 -0500
X-ME-Sender: <xms:0lYAa4ppQNax-ArNYzUaNZHVtgUynizfacRSV57TTTwtgLhW83nvAw>
    <xme:0lYAa5e_Beu9aquxb4vOnz4uefx9HGYa1Bi0T0FOuBYWMFa9_GldpITLZLWhAdhuj
    wuZMpob_H7SQZJ5DsxEkseUytWHRh81bbE7082jAt9KtTq_a6yb5aBoLQ>
X-ME-Proxy-Cause: dmFkZTEeNAq2VSLuDQSYZotlHslwllWV7LHuGQ/5EUABTj8EU+g5+PrSj1ZaDR2kW/6YAG
    zhJpGaW4tT3gK822JMUF2RTr06ElN2rBOAUuPHyxRwWbV0ADtqRKuW7MLvtKp6spEW6y3z
    8HV0YllRGmwGxcWyFcRVaZ0/Stu1RBfgqTsw4RBKMA0O3WU6TGLQYotH9fVJHrVs/Z06k2
    GfJ9o6g6WvjeR092GV6wJyGrTZ5kgSkOstM6usRXDFuDA3D4j8uXYZ/crAKQVlml0JYHsP
    aegxX9ZjB4NGrWkbFXRaaNjGgEC6IFBvtO3w2frpMZFF3K7gWV6xhcyem9ZRY4fNQqQ8hS
    xgy1JnEZ3ajW+NbL5QOlNXcQ/U2za+1mdlOmK6nsG6Iq74tJUQvmFX7pgHmn0IoP17Kqj6
    ivQugkyA+B01Z1XcYjLKLhrgjIK5mlyxWM8uXZB6OC6Ghb0n43k0V7WfxcPmHO15HHHtFS
    qHwDaYsuHWCdju6xn0ZAHlzrHY/yTC+sj2qH+FrNwTDp3hpjmK/heevBtcYS2Q9mJSMCPP
    5h0YaCEFdDDOFlpQiTPg76plMZD2qJ6u+HqYp+56FxZwoG7F6LfsdQ32CYFFBv+rykgViK
    ewWUU4lQrwwTrSbIR+RB6+9WmfDJG5EhD8kf6HcCs75Q0dz/2nUBeK2PLF9w
X-ME-Proxy: <xmx:0lYAa3LJE_1_1kYG8TDQno0mKYKRkVrHnUYHDTQwWk1NngWa1GHqJQ>
    <xmx:0lYAa3sYTZGd2V7vxofmmf3aLiH7Du-85z1VrW8eB2T6BNfLl9-Ksw>
    <xmx:0lYAa0In3NAuo8j-6LNDdfdRUR7ZIhVh-Wm3GQImQduWlh3YcSqMEg>
    <xmx:0lYAa3MET1bljaf9K9oufBRWoT3gSj0POAnJS0U8N-mvIBb0CODRwA>
    <xmx:0lYAa_UOxu1-G_5SgV6lNFg8P7tVpi1waBzTBnQ-YWD7LSFsFfQrjfqs>
Feedback-ID: iccae4b50:Fastmail
Received: by mailuser.stl.internal (Postfix, from userid 501)
	id E848FF60084; Fri, 20 Nov 2026 09:18:57 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-ThreadId: AtZKXeeMT6c-
Date: Fri, 20 Nov 2026 09:18:37 -0500
From: "Chris Mason" <mason@kernel.org>
To: "Qi Zheng" <qi.zheng@linux.dev>, "Hugh Dickins" <hughd@google.com>,
 "David Hildenbrand (Arm)" <david@kernel.org>,
 "Baolin Wang" <baolin.wang@linux.alibaba.com>,
 "Andrew Morton" <akpm@linux-foundation.org>, qinyuntan@linux.alibaba.com,
 "Shakeel Butt" <shakeel.butt@linux.dev>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
Message-Id: <9b68fb81-c2ea-40ca-bc23-ae3d1a2e56f0@app.fastmail.com>
In-Reply-To: <73a452ad-4346-4f77-a2f6-4c801562c050@linux.dev>
References: <20261119193656.88678-1-mason@kernel.org>
 <20261119193656.88678-2-mason@kernel.org>
 <73a452ad-4346-4f77-a2f6-4c801562c050@linux.dev>
Subject: Re: [PATCH 1/1] mm/shmem: don't use the memcg of an uncharged folio
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, Nov 20, 2026, at 2:10 AM, Qi Zheng wrote:

> Some nits below.

[ .. ]

These look good and test well, I'll spin a v2 with them included.  Thanks!

-chris
