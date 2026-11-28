Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795826445;
	b=xwfxc9D0MBxs7kGVJQRaDG5N3Ne1C3Ifd6Vr64BihBqZF6PSb1P3SKOG/fN9Jw82vnxn
	 s1byM5nx5lZciK5nGxKPnitLQDbgebHyNzcDgnmPeI+pXSVgi5UN+zWOyVxGDvYacsQ/+
	 bBoVNmWepj1mlC6JSI7TMMXtJi7wJ+m9FbvHnmIco9YJ1dIkT2XeJF/lpMVkGof9pZ1UA
	 bW25knmIy3FFi6iceZfGhjYkP2Dvec46HZLdKMzk47VSnYv8SQjWei2Ulbj6XgbRuYDgB
	 Y0nyC5v34ARYA07NZ2CB9zSRCwPxpa+dO8eQpthf13q1iLIPq7S9UqNNsWZm9g2iG0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795826445;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=1LRXfi3ljPVCU2K/+RYwxqIvg9IS2N14/NgihSvM4BI=;
	b=AoVcEvTaBR+o1O2vpJ0cCqAqsL54Qp5GAYyzBDsoSBrxxhO0uSFA7/4joIrucbREp0lv
	 KnZJ2gSKmmTuWX9l/zSx40EOtyK1nM5RHdq0TrxRxLlXFkmlkBn12DAUbby7N8cHniIgO
	 9pZNQZYKRVa76ccwfS1Gue9vxWvA7Uyoz9hZzDiMIeykT9wXeaTqdw94UmTY5dWnpVsXU
	 Jr2FWNyyGLOH7jZA46AHTtQXBmRRvP3xtYSPPpnkqFK79DrlewNpDCc+YEaDNGj73A1NT
	 Etd2N8ryvZJZ9e0/7f5yeHtUTCfHRnpXRlyfbTfjPFOJU2+hIF6t+3VoatEoskCG0qQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=stellman-greene.com;
	spf=none smtp.mailfrom=stellman-greene.com;
	dkim=pass header.d=stellman-greene-com.20260707.gappssmtp.com header.i=@stellman-greene-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=QFKEqVF0;
	arc=none smtp.remote-ip=209.85.222.175
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CDCC606A31E
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 00:40:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5CDCC606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=stellman-greene.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=stellman-greene.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=stellman-greene-com.20260707.gappssmtp.com header.i=@stellman-greene-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=QFKEqVF0
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-949680e6d83so775043285a.3
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 16:40:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=stellman-greene-com.20260707.gappssmtp.com; s=20260707; t=1795826444; x=1796431244; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1LRXfi3ljPVCU2K/+RYwxqIvg9IS2N14/NgihSvM4BI=;
        b=QFKEqVF05ghIEVPIPyc5mGzdM/AHNZzToOiVkpnK4uGnc7Cq9CcalrS+lN0Q/joCgT
         k188LM++SxBkJCI0/excufcskDgZnLPblnVbFeZlEfLTvT/6yGWt2WkfCpQe18lmXwhs
         QFIjvLIRUKHZvznsLVa7ZdQ1fdr1q0w7gnnYg8Pem+MeUVazvJIUADsIPMbKK0KkVacN
         /QjnWNttAepXfQIc9J9G5e0FXNbewYFUIKZTmkJbQI1r7/1pZzMOUnkCD0KV46JjH/z+
         RVaA2YYYhLFFVXYvWhAoa7iQ9qJNk4n7jdlItR4dQlMemoUD3P5wqA/OUtH0FVK4cpHm
         mbJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795826444; x=1796431244;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1LRXfi3ljPVCU2K/+RYwxqIvg9IS2N14/NgihSvM4BI=;
        b=ppE/rRBinPz6FulGwoZTdyWD7kULN1YFPoxah5I/8pzbSzO+WCSJ8nKkFJOrYZN5l1
         muBN5FCkl1u8Sgm6yU+GERBYTx7eNbbm627zhqvNdVu6Dr7zZEGMZE7T+yPCRTrnPNjt
         I4tt1TJpjjnhZfYYwMoK65UY5q2+npvcKgAjHUEQCBCrLeu8lNzpT9xapYhytgfnnyy9
         A5e+wLfGFUIn5XjNRnSY7cTHH4KCyzks4Mq46PxP4UGcKxkj8vYTUOTQG6vBSd5CDCF9
         mUJlz2dDnzerSqgj+2tImgT5sOxVdeCmVN/ol2c3xE3nhANapOnQRD3EsGJW6xHcTXMj
         /ONw==
X-Forwarded-Encrypted: i=1; AL+hErGN3YqVj5st/RZBpshmV5iZxw5wkmUAYL2EfNQ/wFJgVg5tPg4wHMg5NUPQvvwvL/QnbyxpIVVbZLv92t4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9eIPCbJfIJl2zdxBZ/tMU6X8qT0xOVCR3hrbywZXDBsYuLmEEJ
	O9QMbjOxtbmNYVp/RwaeJIpAWrDXkU/4TaTzh3OFY7rHwSMClQxLtDjObbYL7QfnQbI=
X-Gm-Gg: AZFdTZcLHshSyc3tTPi0mHK/fSR1rv6HtOBM+cQwkg6kEl9NUgY5KOo35gRVECrINdx
	RWotLSwxsiinSKcXrriSkpT99ZL26GZUuGp5y0ul85j+q6+2ycIr0DWazwOSiQcXM7wfGr0jhIu
	Bl8fCZIiBpnD+jIM77q59HvpzryovE7yuK0z/8xDeG2r0jGhji9N/IaCHW+BPRtAhxHvMD+YP1p
	UZ2EIGYP0QSslSUUR3tMU2CdQ4xr+3daN7jpV9UWsfmKaODFEsJ5MhW2SoSx3LygseeRhRuKSGR
	4MjEU16qHH8BWbse+BCiMzKmCIGlfqGCAULvxokhCmzCd4fcRwv40ll6+EbQGyI/ySoQMCEX9k/
	5bfnebEVWC9hv+LB/p95Vq1orDtut6+AOBLOWTWt2ytVJtdZ4yDLIBDSWvEITTYxLjkNYazNHs3
	lwhudBBGaT1wjWz3Y3hZoBgtXd7g1WTfrx3dItmSMQK8DkymlzlNmA5B7ELJH/3fqN113f4FFY0
	H8UglVCTtpEx81jfO+G8EBfSp2gtymuw2byUb0SNPGIThs/W+lX0jbZ0DX6p37rx2XhJCn2NhPz
	winweG+SruW6QViw75krQchDX/363F40LliBzUUjknWhU2ioSXnp6soCgf7Mrn/6c8QBDu+a1vo
	UnPMb8SNW
X-Received: by 2002:a05:620a:2988:b0:93e:c12c:f11f with SMTP id af79cd13be357-949bab3a1edmr4751291085a.75.1795826444355;
        Fri, 27 Nov 2026 16:40:44 -0800 (PST)
Received: from Mac.mynetworksettings.com ([2600:4041:5c28:200:a4e3:fb15:aef5:60c7])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb38319asm1954823985a.16.2026.11.27.16.40.43
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 27 Nov 2026 16:40:44 -0800 (PST)
From: Andrew Stellman <bugs@stellman-greene.com>
To: netdev-bot+sashiko@kernel.org
Cc: David Howells <dhowells@redhat.com>,
	Marc Dionne <marc.dionne@auristor.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	linux-afs@lists.infradead.org,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next] rxrpc: Reject unsecured calls to userspace services with a minimum level
Date: Fri, 27 Nov 2026 19:40:36 -0500
Message-ID: <20261128004036.50389-1-bugs@stellman-greene.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <179582184048.3135.8278153392391816452@kernel.org>
References: <20261126224137.55862-1-bugs@stellman-greene.com> <179582184048.3135.8278153392391816452@kernel.org>
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

Thanks. The High and Medium points are fair.

High: I left rxkad and rxgk out and mentioned it below the ---. A v2
can check the negotiated level against min_sec_level in
rxkad_verify_response() and the rxgk verify path too.

Medium: right, kAFS sets ENCRYPT on its CM socket, which also takes
callbacks, so for kernel sockets the option only governs outgoing
calls. A userspace program built the same way would have its incoming
unsecured calls rejected by this patch.

David, which would you prefer: enforce the minimum on incoming calls
for userspace service sockets (NONE, rxkad and rxgk, with its own abort
reason, a Fixes: tag and a rxrpc.rst update), or document
RXRPC_MIN_SECURITY_LEVEL as applying to outgoing calls only? I'll send
a v2 either way.

pw-bot: cr
