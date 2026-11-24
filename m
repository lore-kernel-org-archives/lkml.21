Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795486960;
	b=TFgTGMABYfGXDixYO0P+wOgkL3Gdt09q2g0GY1q8U9ASLuQBoy2DoHpBr9SMHlzvgeYr
	 LZ4CweOGCLmb9DvWcUCsOXjNClywZUwtGQfIMfxJE2u8S467JsS3vvBzTQOIPFQTm4Cl1
	 IVQQqoSwh/15Vac9bw6JXO8gaHxoAtOlTUq0UTfUsCW9Hy8r+wHK5acTxeXOvtwrI1IqJ
	 /kbUCk7cr927gRjga4AGvRtOePoNPSHtOeWdj1zqx0Y+Ci+xWvndUvKDLtTgl6L3KLGYP
	 Pi0Aaze2sR/wbZkroEpEkCF76r0sPoV/FOd3M277wjBPDjdh4Fw3N3nlWLDAq44+ozw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795486960;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	bh=Al/HgAlWfQ6iceuFxEpzqibnoieoIm43yof5XL41sFg=;
	b=D7lBqZKo9MystSrhnwD2Rj+Xs+a2qnBfBvH+wTmoSARylJFdC8qu8L3fkGHgQYbg4Ey8
	 fSd0Wl//Ut9PLtQV59HVfrC5cz7IAOnzV1aG/50vX2prCmQ2pghp3NarxGPxsKe5lENqi
	 vR19cjkEM75McBO/k5KG6BEmQr8VjAt/7Ce6qsTaUmOaMi3w++RaSDsjc/Jai0BE5NoKB
	 Beh/s38gyZeauGKXRs9n01uHfxfIHnBwCyu6p/jEupyFr5VvJzHsG6OklnxvN8BgH5v+t
	 dCJZLPLbQYFlK7woUjN03cl70+92KlfzLmwuXqnIsvXkhsg8iieqI7+5WQTSV9t2qEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="WevY/F63";
	arc=none smtp.remote-ip=209.85.216.46
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D54CE606A322
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 02:22:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D54CE606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WevY/F63
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3b4a93d0814so767291a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 18:22:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795486959; x=1796091759; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Al/HgAlWfQ6iceuFxEpzqibnoieoIm43yof5XL41sFg=;
        b=WevY/F63WgcrmmjbcFRa0wU3f79Y++u2Ms6yFCScdMmM3rFtSjM15hePh42gU2Avph
         xJ5Mz1CVB0BGai1lMtqC6gRZV4JEt+dDqS11BQBys5KQUPH6Up+/mRAZnQ6au55fd/iT
         uEDLwUJmYPXXLxnO0OPF+UKd6OXxunLK6kmj/YiQf0u//WJgwjd78uMDME2hZjjJUL8Y
         gxKqgqlrpv7aoN2JgLa4V7KyM0FZviXfW3B+gzhkLTvcUHwSjRLKsPHcaQtpIlYBwO7G
         PkpxGDFWGDZ5ux9WV7vK7FfbLHN5gGbucVGahYfKpdVU9CEhSNKBNT9cr3CbCa/ir0N1
         WFwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795486959; x=1796091759;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Al/HgAlWfQ6iceuFxEpzqibnoieoIm43yof5XL41sFg=;
        b=BcCuMO7g9wA36YFi+lB3E44g58/xd/a9bpslNfwHr6aH3NCXxEhEjPjizp+LBfDjfH
         Q4rr+gLoPQDwchjGzTcfJEq0qQyVIwuoOXm3OViqsG7HXOCUphlcUJqWp2ZKvHxkd6TE
         P8Uo0DaoVEQcJn8ryWL47Y6BegKyDWfg592/m5umBg/x8lA58HHsDmpq/6u9iIMUPbht
         6i+dAPmZ8wtxMcdDNyTADTQPr4OmeYT29uFRNPd8dmNUoWhndY8RGzITlLUapv3REJLZ
         kSdVkAj0xRU8y93hJgvcwo2EkuBSk+pZx7fOOlyxY4HeSgMErGnzCR40X841uzZf9vlF
         czYQ==
X-Forwarded-Encrypted: i=1; AL+hErHT5bfWv/Wzuj57Y4CtDTtCGXzUXXbfmzPFGYktziLWH1+Mc2jdmBa75utZrXA05BXobC02PFklNnIGmDk=@vger.kernel.org
X-Gm-Message-State: APuU4Z+X8rKq41aP6eW9pU/muJ43Lc+k2ytZ/x42QQ1k/flSWGs8yZen
	mJphrKDYtoTQNkVpGnPy05Ug1TpVeyqDw25gW3rzegl1Tr8JhOaNkQdO
X-Gm-Gg: AZFdTZeVEv0rWNyF6ETtSdzx56OZJxAHmeALGScAFc7hx+gtz6+4l2lznH+54YIS+Yq
	f3XfkqKhIl0pBVnNLy8as+AEahCWVCNhveFuqB+VG2Hg7ta/2LbWVWA+FWQtmOuaaHfmYlQKjLl
	R1qjShZP340dcyqmulvB024s8koOtgEFxEdC19VN/+76pOfnvU2IKM8pxGK+6E7TgYQnQX5d/CN
	zX56Ae3sd9Otxomvz1Hbnhpa+gSsWBxhhUBgCxGVyUL2ogC4wSylHSFVGcRM2IiJjuadb7DYI5B
	xr9L2dBZ19q3I9SKab1fYLZ+ZIPdb7bnUPZsbaOnpDkdbNRO7BmIWRAEcCyEkZexHF2jKY9iru+
	dvjZFUMB7xRF47I3JVCfShWQxpxQR6MKByWNIibubRlks0uXmsSIGUtnuxgjZaBhN66kwT6t9rx
	NhCdVm/fVj+RDXq21iqqsz99iWNwKqEPnwynMyQ/pRs1tgccVXOOQy1a6N7Xdd6qfMOdFjm/wks
	Sl7fBN1YDN0FGRh0RGp/Q1jE6cxgdK+wA/BOL7f6omOb07uDfOQTvnzJoZeP0rVBQ+XJ+reSdJu
	XF/l5PSbLEp/Y8kBYn1trmhgFCBe7Xvz1qL7FNEyVsUMRR/QM2gLpRJOhFkMCyagLQSt1jO87L8
	bKXdDNNBxjp5gkW/EUbJX5CDN
X-Received: by 2002:a17:90b:1c08:b0:3b3:b632:7f2b with SMTP id 98e67ed59e1d1-3b41c98a3fdmr10861646a91.51.1795486959115;
        Mon, 23 Nov 2026 18:22:39 -0800 (PST)
Received: from [127.0.1.1] ([74.176.208.23])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b6fe711sm8425496a91.1.2026.11.23.18.22.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 18:22:37 -0800 (PST)
From: Yaohan Li <shunsheng1218@gmail.com>
To: Niklas =?utf-8?q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Rafael J. Wysocki <rafael@kernel.org>,
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Lukasz Luba <lukasz.luba@arm.com>, Magnus Damm <magnus.damm@gmail.com>,
 linux-renesas-soc@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] thermal: rcar_gen3: release the IRQ handlers before
 the zones are freed
Date: Tue, 24 Nov 2026 10:22:31 +0800
Message-ID: <179548695107.1834709.12105107414276177799@gmail.com>
In-Reply-To: <20261123064745.GD3898744@ragnatech.se>
References: <20261117145348.1092528-1-shunsheng1218@gmail.com>
 <20261119022926.1493582-1-shunsheng1218@gmail.com>
 <20261122144813.GB3898744@ragnatech.se>
 <20261123064745.GD3898744@ragnatech.se>
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

Hi Niklas,

Yes, I agree.  I have reworked the probe to look up the IRQs first,
initialize the sensors with IRQEN cleared, and request the handlers after
all the thermal zones have been registered.  A devres action disables the
interrupt sources before the handlers are freed, so ->remove() is no
longer needed.

Since the thermal core copies the zone operations during registration,
set_trips() still has to be selected beforehand.

The current version retains the no-IRQ fallback for -ENXIO and propagates
-EPROBE_DEFER and other lookup errors.  However, if IRQ lookup succeeds
but requesting a handler fails, probe now fails instead of falling back
to polling.

Would you be happy with that change, or would you prefer to retain the
original fallback on IRQ request failure as well?

The reworked patch builds on arm64, but I have not tested it on hardware.

Thanks,
Yaohan
