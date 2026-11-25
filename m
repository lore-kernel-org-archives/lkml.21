Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795627077;
	b=UDScf01JYMXtq14KjjEwizteUK02i12YK5mJ1mt3ybNI3HrpIPJxjkKNMdAlDaz0DRmn
	 avzZIxPAxZ+6d2PALsj+RuslNNv4gnqwWq4hPDlAOvIuuS11N4r3tiFRe3mqWlezccMrd
	 osEp0wXEUHT0aK95jr7yGQZJ5wJktCG7HaUM2CDjEcepNSHiY+O0g8Aaq74EQ2EeDhegz
	 MtMR+t3P4FJzPYjSnwZOfJHfj84kvYyYk3oNFgHVZYEZ1qThmNhfvI+ktvTfBI9ZHI1/L
	 hTpaouF4cUqRwwxqvXHEiCJaUqn07m8xLNVAHBMrm1T93sDnQWE9mWkne/UeX+YUO0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795627077;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=wCsrlj2L6zjqB33Ast7cbJ+UpGvbZhXlTc+v7Iwr5Y4=;
	b=A23V3hqlcSfRdU57TGyvd+tgjlRcsyW/JcTMRgrHMqFpRI3rinG1ChL7D63I1afHX9cL
	 fFulZOKw4VZsn7ij/AN6Nc3FobqvjeWfhcfBQzICTrwdl84HP7F8XhyY1qrOorgaUtcL2
	 nq+HJwZE4zheGQC9Ct3X/nRGNvoC0R1dJPQ402gExuj9sKHff29ZewCue3izo4gNBaw70
	 BV9j8haMizT/exTSGJncDJI0GArMTfbIvHBu5OB4DU4S6BHC/czuLQhxuBOYQMTCB/eac
	 xV23dJ/n9Ggiow6+eIQJj24SVey0u3AAtLSQXBPdBF37+KMRBFBWUsDJBMQDQb2tAcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cs.unc.edu;
	spf=pass smtp.mailfrom=cs.unc.edu;
	dkim=pass header.d=cs.unc.edu header.i=@cs.unc.edu header.a=rsa-sha256 header.s=google header.b=NSWjJ1iU;
	arc=none smtp.remote-ip=209.85.128.182
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 118F5606A323
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 17:17:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 118F5606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cs.unc.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=cs.unc.edu header.i=@cs.unc.edu header.a=rsa-sha256 header.s=google header.b=NSWjJ1iU
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-8b51389f58cso66507557b3.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 09:17:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cs.unc.edu; s=google; t=1795627071; x=1796231871; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wCsrlj2L6zjqB33Ast7cbJ+UpGvbZhXlTc+v7Iwr5Y4=;
        b=NSWjJ1iUECaItAnSN36JkBuxnJeihAN1EnFqPIS4u87+AdZkqu0BV4VfhwU3YOP+Ur
         87mcA2IFlmnUIjtuKeln/royBzYUY3o0XOTPbzKwWPBEQNuQV7iqlg1EzveubuZg6Z/R
         Qtc/eQJ/UwYC1JHV3JJm/rKRvENuDxeGm4bMUEpmsMqKqRq9N6ldLEXE2rF+RHxB9ZkP
         4HTvEIVHpr/ASt3QJyxQ0Mj3jHjBg2taPpLGqXvsSIorNPm7IQFEkrL82gkTpQSl/764
         DxVuEwAFEetlrEBtLbvcBChVgzW21WCK9N7HRxMEKsSKHwVgnELMPATFjhA/tbka6uex
         qJFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795627071; x=1796231871;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wCsrlj2L6zjqB33Ast7cbJ+UpGvbZhXlTc+v7Iwr5Y4=;
        b=Zk9+0zWJK5P/87RFNT4KmnNck6AYjsZWx3iupvOHPuNCFmdW1DsIh7ImhmCuGtnE7E
         hSS0y0U9F2HhLvovdTnNdiq30cdpbd8kP+5Qa6OpnLN9akLOUxIn/XJbKKTeJv5DCZ65
         v+oRSYIXNQ5rh7rfSSU7qcudncxpot+cNoVzEUfatcS3/wYfVx9XlBYerI8vgbOMObLc
         cXEPsLODX9dROhwNtMkiMMTMV93yDkcXdtwd6QKPadDR+gUghktNgOMe8kNkfzMY7qoF
         +vypWGQCEg9vNVUjyxFLDMmt3/mgEh7XmtOduni06QxJde+ySE+/XD8hsGLvPbKN3F8a
         CpRQ==
X-Forwarded-Encrypted: i=1; AL+hErGVdsbbXc713j8MUAA6kkkJp87UIKLoVK+z2V0odAI0h7c3N753L36PD27ykbLa0RLjKZkV0L4V1/Ux3iM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8TptEBVEfhASYjjdgIVWdUuOpkKBkeAh6txRnfFMNpVAu0sS71
	f63u7cbKsA0hiODRK4j9U7Wo+qZCUnw8llHDk+MBn1lKcA7wkeRqdMn/3x2TYrsfkQ==
X-Gm-Gg: AZFdTZesBy5toX2KeZibcZuM5z/EJfnD4HMs2/D1CkuFszUhigt0LvHkrYxD9CLgjtq
	bnwqT0RXL9j8HNYt0f/ZVU1rC2MhWhtlE2Gd1UPyC1B9Sw/Cj82ZAj4nRiZHLEn3VVIkeytYy1K
	EFw0zrsgJ6jtJG4bL+NR1CddicxwPHUlInbXAGBdqbZY3qeyX4xVsr9mwqFtNTXu7u58HC0p1Tj
	CkRzGsw2RcuB2uKpI43V1Nwm3Ba+xePv74vupaVzXfHSbwX6tHsgPgeQ06Bh3VO3weAK9Z0z/dU
	ArkqlOpY3mT/Gika2VMkddkNs4FduEyskFUK6I4JHqCKQPlfhvKS4nRDfe3WSj43JmaoXHpkiJ+
	u0wfQafvswYos5lB1ECFosYD0DEPB+o1lWXDDgRaaeSeTrIw4wloGt1Ze1QtkdNTqfOpGyFCMu8
	k2x6jNrnWf+bLdjN2eotrzwgUD9Zm8buQN6J5f4BSITOvRKFdz+5WPQeMi9Xi6FVlmeIntiZ6hp
	V76yBzi30xPyyLDjqsy7weVe/4Uctuapeyl8wAm/hlFr5iQ2U2yM2bd1Ny5CTuAb/Qx6gYZ/V5m
	uwuCNGNOpMRbNW6KgLIuPSQ12CLHqTRJNYmlbgGxkxqX0K/GAsY/gW/XhP8T/i7eW/mBhDOJ+Q=
	=
X-Received: by 2002:a05:690c:7348:b0:8b4:e905:e772 with SMTP id 00721157ae682-8b52050a47fmr74530757b3.92.1795627070780;
        Wed, 25 Nov 2026 09:17:50 -0800 (PST)
Received: from cobra01.cs.unc.edu (cobra01.cs.unc.edu. [152.2.130.143])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b5201b8cd0sm75087847b3.2.2026.11.25.09.17.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 09:17:50 -0800 (PST)
From: Hengyu Liang <hengyul@cs.unc.edu>
To: Qu Wenruo <quwenruo.btrfs@gmx.com>,
	linux-btrfs@vger.kernel.org
Cc: Qu Wenruo <wqu@suse.com>,
	Boris Burkov <boris@bur.io>,
	David Sterba <dsterba@suse.com>,
	Chris Mason <mason@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] btrfs: remove "rescue=usebackuproot" from "rescue=all" shortcut
Date: Wed, 25 Nov 2026 12:17:40 -0500
Message-ID: <20261125171741.3518473-1-hengyul@cs.unc.edu>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <9155e9f6-9d76-43b3-bd20-a4c98a9f2c84@gmx.com>
References: <20261117030353.1738805-1-hengyul@cs.unc.edu> <9155e9f6-9d76-43b3-bd20-a4c98a9f2c84@gmx.com>
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

Hi Qu,

I found this while comparing the behaviour of different kernel versions.
I used an LLM to analyse the problem and to draft the patch and this
message, and I analyzed the result myself.

On 2026/11/17 14:53, Qu Wenruo wrote:
> Furthermore, one can even argue that this behavior gives a higher chance
> to mount the fs.
>
> Thus counting this as a bug is very weak argument, thus the whole point
> of your patch may not even stand.

I agree that slot 1 helps when the newest tree root is damaged. But
"rescue=all" is also what people use to copy data off after an unclean
shutdown, and there slot 1 can be worse than the newest roots:

1. The data extents freed by the last committed transaction can already
   hold data of the transaction that did not commit, while slot 1 still
   points to them, and ignoredatacsums reads them without an error. In
   my test, user A deleted 30 of 60 files in the last transaction, then
   user B wrote and fsynced 60 private (0600) files before a power cut
   (I used a copy of the disk taken at that point). With
   "ro,rescue=all", A's deleted files are back, and 30 of A's files,
   owned by A, contain B's data. Copying the data off with the owners
   kept hands B's data to A. With the newest roots (v7.3, or
   "rescue=all,rescue=usebackuproot_0" now), A sees only the 30 current
   files with A's own data.

2. On the same disk, "ro,rescue=usebackuproot" fails with "chunk ...
   has missing dev extent" (-EUCLEAN), while the newest roots mount
   without errors. I also have a syzkaller image that mounts with
   ignorebadroots and usebackuproot (plus some unrelated options) on
   the parent of c73eb6f72741 and fails with -EIO on that commit: slot 1
   has a bad checksum, the newest roots load. So slot 1 does not always
   give a better chance to mount.

I have two suggestions, but in the end it is your call:

a) "rescue=all" tries the newest roots first and falls back to slot 1
   only when the mount fails with them (similar to the retry Boris
   suggested in his review of your series).

b) Keep slot 1 for "rescue=all", and document in btrfs-progs that an
   older slot can point to reused data blocks, which ignoredatacsums
   then reads without errors.

Thanks,
Hengyu
