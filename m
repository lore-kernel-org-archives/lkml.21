Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794996001;
	b=0umCpiqsWoAyv50VBS5ExT1klDQ23YVEuzKhE0sWjHgSe465pGAq4CXwSNMdcYmq2JnR
	 N8hNEAGE07Y0Jl7L7alTnQvvFYM4WbQhgjz+SO9xYXhObBD8z55+sqYRUei8qFhLdIyLH
	 OFKWhos6Kf2FEeTOr/UjrpYaoOpA0tPtv/jStMLUFtyjvhDKDHvFnIlIN19LZSJP+ICyc
	 unNTqAo5I+nekBF166iugwIAHUsTDcZPW1PJpmc9fo7s6pkhhJuT+dlqwwxiaERWGuE0G
	 KvAqpDntf6IE4mjMLX1W0hKtUUnCyN2+aRoI4ByPlGq0rVJ/IUEpnhQxFts0NQuz6PQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794996001;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 Subject:In-Reply-To:References:User-Agent:Date:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=lhcfRT8eI0DM+C2zEBL/75QjU+nlkIKJUJYGmyhthQM=;
	b=mky0SZd5Epq4EVxyhAXBAcDlNPIS7WBobw3K/x5IwKkiZT26oyA+Lc2b7oN5XKyEIz+r
	 +26/zioCQu3XGnVBmdphtZGfmro7/byDT7ESKHQjQKFiM9BaT2VW4uXeIBpiKCJyVNfmw
	 S1kBexGCEPTJnTTjVaCWE9oB3moi4pz3TlIln5Rv1yL+2+D0s4P3KsDCVm7h00JOLQ4I8
	 Whb+sDcDRMlmoC3UwlAvsxzyjCZ3WiqGD/w52AY6/ac7/S39bL5ZaSWYcDlMP/PW+xdOo
	 5Ks9vwqJqjJuM9ASeV6K2PO3DbA+4aVXoDgb6LCHzIK3AYUlAEfV5n364IMuSHhDDag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=vEwZlfsg;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60247606A32A
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 10:00:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60247606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=vEwZlfsg
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 0781A1A16D1
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 10:00:00 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C8C955FE9B;
	Wed, 18 Nov 2026 09:59:59 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 163BA11BC0EE3;
	Wed, 18 Nov 2026 10:59:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794995999; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=lhcfRT8eI0DM+C2zEBL/75QjU+nlkIKJUJYGmyhthQM=;
	b=vEwZlfsg6wAWVqVcdn+L5GqquVth4TzV1ntiNPJadhsPjzACTPY71X8lO5sbluY0+vq3jx
	LvXsCGi0pdwL2+Du7599YQs4V7oVw3HdH/dh5ncImJkfB/CiCKYWTCoxzUoDkq27RXxZBH
	rYxtaJjBePejsEV+/2foYbS0K+f2SgUYstNa9RbcKnaCkZ6HS0grC+5IF65DIUOCejQOhq
	cRKfT3WoPOOJzDYDgnRXgpTTxSJw7re8UHb9+INQvkj3Iz+rsRd064zVbOvl7C0VH0iqoc
	VM+uGRjg9IvERbwHY9rNn3ke4y+1pkNHN6KJa+2LadAOnRbxYBx8IGMQ41qieg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Richard Weinberger <richard@nod.at>,  Vignesh Raghavendra
 <vigneshr@ti.com>,  linux-mtd@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: rawnand: propagate BBT read transport errors
In-Reply-To: <20261103-submit-rawnand-bbt-read-error-v1-v1-1-2ff0abffaf2e@gmail.com>
	(James Hilliard's message of "Tue, 03 Nov 2026 23:03:39 -0700")
References: <20261103-submit-rawnand-bbt-read-error-v1-v1-1-2ff0abffaf2e@gmail.com>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Wed, 18 Nov 2026 10:59:57 +0100
Message-ID: <87a4n6jw82.fsf@bootlin.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

On 03/11/2026 at 23:03:39 -07, James Hilliard <james.hilliard1@gmail.com> w=
rote:

> check_create() handles uncorrectable ECC errors by invalidating the
> affected BBT copy and handles corrected errors by scheduling a rewrite.
> Other read_abs_bbt() failures are ignored, allowing initialization to
> succeed with missing entries in the RAM table or to rewrite a table that
> was not completely read.
>
> Return non-ECC read errors from both the selected table and the second
> unversioned copy before updating versions or writing tables. A transport
> failure does not establish that the selected table is corrupt or that an
> older mirror contains all of its bad-block information. Preserve the
> existing ECC-specific recovery paths.

Be honest, you did not read that back. I don't think one would guess the
big picture by reading this. Here is a proposal:

```
ECC failures have dedicated recovery paths: -EBADMSG invalidates the
affected copy and -EUCLEAN schedules a scrub. Any other read error
(typically an I/O error) would be unhandled and leave the RAM table
incomplete.

Make sure those errors are propagated.
```

Thanks,
Miqu=C3=A8l
