Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795018068;
	b=Q30SlR295Kg7NiQkTIXn/f3yXKKK5Y8dUSR1fDDwowxnDyOYi5ya6pa1SV4thYx4twVd
	 YLA/VAvxlccxHp1ty/Z5F1GBz72CFT8PqTdBPdyvJf2Uw+B/uuT35XhxCRyAg3pBUNbT1
	 iXfgyVrpNgd+4VCq6EmwpaExKfGL+vHNt0evmhfZQD+AmOWV7V9UuY9/IVzwD21p/gUQU
	 ERIUUnRR73LgLESbvbaINBvQjUcDwzkqD7fSRbmUBONElFYvQ60XInmDpyy4Oo38jo2Wu
	 Y4QEi+b17XATIQh+NZD1B6yUiy3bVX7xRQecouN8bXUDm432kHqy1NEWTSUiyGOU0JA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795018068;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-Mailer;
	bh=DIbUD6coJDkzT04ilTmaJVjGCKSpyXQmASeGsNrOapk=;
	b=reXe/YeEDGjoyBUjzegl29t7N+vsPDSEl/C+lkwfNwc9SZRxUM5vv9xnPpFCxJxma4If
	 h05aa6NLRctURR/+XyncWCraKGtv2xUQi3JUk1+TfZgEE9qdI+9l8NcYqijMLmtn4QJwt
	 0DgdGMEnPsIO540iP+ndpNNKjg6579m8I931k4+ljKkt+0xREyemjPvye+1UZ+OgicA2/
	 o9/uw8JfD4/8UME/z3BSNvm28safPMpVfy1x7uRN6nrQ/cb8sXxRtR2IEigOtdEqFqXnV
	 IbQ6vDyEUCH+060VpqUvtChPKCJ1z8xun2L4uys4FQV9gbArl1gGx4WXslnVPRuzJIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kernel.dk;
	spf=pass smtp.mailfrom=kernel.dk;
	dkim=pass header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=ai3FTj3t;
	arc=none smtp.remote-ip=209.85.167.181
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF8CC60A3831
	for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 16:07:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF8CC60A3831
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernel.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel-dk.20260707.gappssmtp.com header.i=@kernel-dk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=ai3FTj3t
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-57297329b3eso615351b6e.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Nov 2026 08:07:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20260707.gappssmtp.com; s=20260707; t=1795018067; x=1795622867; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DIbUD6coJDkzT04ilTmaJVjGCKSpyXQmASeGsNrOapk=;
        b=ai3FTj3t2+3mPftgVKUm3aRG67g3C58w1EZkUuup0vnCgaWWhvm6NQ38URls5hKBr1
         nosqK3X+zyyLepQGUaUkgnSgz28oqk284Q6pp6DCJbF2uqA6/ln2lhsdS0E2Lv4qRboE
         aBSaH4ZQnr5XbDZ4Pat/sg5mmeutIbyDkrnfUuOZx7Hn8WJbBoYr3DyU3fAtGO1e9pah
         lk4EhZQOi/IFz9O4vYVB+fS1QehPJHF65rchUcFDKN4Z7SuKIry3FAQIz7+LKVjVTUeH
         acbBl0k6V2byLl1msgV0aIsvQ1GPvY/fwxkERg7rdTxVQhb0CDpHLLG8XbWr+gt+txaO
         iFOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795018067; x=1795622867;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DIbUD6coJDkzT04ilTmaJVjGCKSpyXQmASeGsNrOapk=;
        b=AZ7g7ivN4NpJi7sDcmOggZJ3LJ6hcshyCpO/OSV3qM04aCc7qTLGPAXQDiqG399fem
         0ydyMsZAMOZFGKVZMhPHul2pgpq5KQAcV3zVgkvaHNxgKfUds73N0MwBjiZohJBKTu9q
         c5uAqBa6dw6PFW6Wrc5IIrMZaTk+czXCk5AAQLd4VfcgOj1zz6avt6dpLRUIzBgYYcfA
         P6nyxHkF05zdUF1CU4FHa11g8TxgkF9DtMsnSYfUuYsd2JazZFjCFc0azFhXmtrchjZQ
         C82bOnqwmP3oENqkkqR1V6AZxVRSJqubKswEeAKdSbWDK7QoK0aK9ahK4v5iMGLTgNHo
         Akyw==
X-Forwarded-Encrypted: i=1; AL+hErE7H6EaABJBkPtAhUrGCClhR1kWtPwqsbEki2Kxh1F8efkIbhXKAoSDrVotqHGIsxgpZ+0j/7ydu7cdHhA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Qcrx5Pf9Kf40ZK76V0HWcuNBDoZV6s6Z1i7bfTCiGw49Q6LKF
	q4+oILGvbdIk16NzPOupZFS5fM8uEMJyXr7DnOxJ7rJ500v1SSIytwci/ONjgkdtm2w=
X-Gm-Gg: AYBFou1+qbdrdIThxtK7XN4m5gx9jmbZYLGvMjh0sc7etbS3zDDSuESly0dZXjQi8+W
	JXoBHgxihwKvJB1SNzCKwaNwArqLlgKSVInZ18Kj94fKvd99lNni9IAvp1RQV3RBvjZ4WlPEzWe
	zKbj4AWZc48Z9oI1co0IK8/0oI8i/LpyFNkZmvEF8SlbfYEa8jXGbta2iyl3RsiS4/Z5czuSiuk
	GjkHixT4xER/FxPyYF1oPJkezXUmkLN7oX0o6LcLSLDZsbhMhkgNhYsb8p0WZWvdZVSOmXtRARh
	v3Wf8mtGnL1LbRVw3OqBpczy0uBqTn1pih4aWWWTeQyO2g1F6vzc5PhsXAk7PYp+50tfH8wKZt5
	VSnkey8izETzFiTiUHNql5Iny284aeoCLbY4u4p6kymUfGuILSXT34l/JFPf+UxgBSW00c/9UVn
	dize8GnxPI6QzEJ+lZiS/+UgAHAhS+mTybMaZ1GvefyGdBnQ1N5SKVVu/CajZajzWBZh7uYx+hb
	Y8GX+db10wZoJNOmnPVZeViv9UqRDsm86yls16yqtS6cL8T2OEc8PKt80GJ74zg82A2WruDa/+p
	gHxJghZ1dgKdnijkVYFpXYy8GyOhcl4tJuMU0NoAlyCIkIhNRLC0F9fwu+oPXmxswFLuKCkyl03
	9GN/q6ZWu52PJPtzfApKl08AtPZU793RmB2WXAfdNcaXLYmZJX5w=
X-Received: by 2002:a05:6809:59:20b0:564:36f8:ee76 with SMTP id 5614622812f47-5773db2891cmr2282704b6e.7.1795018066756;
        Wed, 18 Nov 2026 08:07:46 -0800 (PST)
Received: from [192.168.11.112] ([96.43.243.130])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4b743721fe9sm2624231fac.6.2026.11.18.08.07.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 08:07:46 -0800 (PST)
From: Jens Axboe <axboe@kernel.dk>
To: josef@toxicpanda.com, 
 Guilherme Giacomo Simoes <trintaeoitogc@gmail.com>
Cc: linux-block@vger.kernel.org, nbd@other.debian.org, 
 linux-kernel@vger.kernel.org, 
 syzbot+d7d72f3d467710442af0@syzkaller.appspotmail.com
In-Reply-To: <20261112105939.260856-1-trintaeoitogc@gmail.com>
References: <20261112105939.260856-1-trintaeoitogc@gmail.com>
Subject: Re: [PATCH V2] nbd: Reclassify sockets in the reconnect path
Message-Id: <179501806580.17649.2876095416581742377.b4-ty@b4>
Date: Wed, 18 Nov 2026 09:07:45 -0700
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Thu, 12 Nov 2026 07:59:39 -0300, Guilherme Giacomo Simoes wrote:
> Commit d532cddb6c60 ("nbd: Reclassify sockets to avoid lockdep circular
> dependency") introduced nbd_reclassify_socket() to prevent lockdep false
> positives when NBD sockets are used in memory reclaim paths. While
> nbd_add_socket() reclassifies newly added sockets,
> nbd_genl_reconnect_sock_cb() omitted this call when replacing dead
> sockets during reconnection. Consequently, reconnected sockets retain
> the generic socket lockdep class and trigger false-positive lockdep
> reports.
> 
> [...]

Applied, thanks!

[1/1] nbd: Reclassify sockets in the reconnect path
      commit: 553d28925fdea4044bad4ae1e2bf9484ad21f758

Best regards,
-- 
Jens Axboe



