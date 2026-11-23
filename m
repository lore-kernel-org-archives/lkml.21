Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795458406;
	b=zV/p8roTC/aWVJ6npsyUJz6zEhpj2MZ1XmESj2BPEpXJfQ0/j0SQlY1ZxLagq4pD1tSL
	 BTUb4QuT1upfuB5aV/jdyyqPbYxSrLUAfgViFuPpGvArkpgNYkqfhvIuF+5ZNcO+7WuaZ
	 BnEPZSF+9RRXbbUMmQm7RMLWz+CxFV325xBl1rbfv5cetR51eY0Jh3GCI8Sm5Dp26pA6f
	 Eq0EfEKVUlKVsRhHuKehCv02brRD0OntWHAGs8uNEFgmP0aVn7GgpROUS9jnshMBn6TtL
	 5JIqjnQ4cWpyVU+TGj/thgC3rExt4R7miOv3mjcW/8BOWLk0I9TZc0ME7M1b6ECtMQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795458406;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=thHuqHmooBy0uGsMcFJyj79jvgcNxfQof3z9Kg8ZrOQ=;
	b=Sm9/4JGzutvNZdZ2VhAkA3HtP1j+VbDWZ0H44brNx3d66/4rOXuqyfqRqzxBcQidiirk
	 fD2+8xGhWGay6B2ZxIuyv9XxDK1WV6P4+cAIdXnnzQ3BxfmNp+50nXgqtB+k0SOByITI8
	 GJxeYTxwINWnGBhjbVliEUP/2cZUyZOAbUXKq0dUqsfrVRFilqVw24hH1K+B4xf68S4Zi
	 1PdU342m5qKau2BX/pr+WPcdlfkDWyiaxL9+lHztkBoV6fiDNJK+rfSwwdx8KSOLIL/nY
	 n66yu/4p+LGZ7nYwCv/hEONhmcK+a44R62jLmlj1mK9i4vT9saWNGo5XqAe0o/3Z7pQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=A3CgtlLr;
	arc=none smtp.remote-ip=209.85.214.179
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41E00606A31E
	for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 18:26:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41E00606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=A3CgtlLr
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2f066274caeso12684375ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 10:26:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795458405; x=1796063205; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=thHuqHmooBy0uGsMcFJyj79jvgcNxfQof3z9Kg8ZrOQ=;
        b=A3CgtlLrKMI/0wVqoxsYUWu7YEQMcNCo/SoU3XWimCZPRdYmKz6jWB6VbK0N6DGBBM
         MW7LmbyTpBgl2XThw5/fstI6W2Rv8yxc8XG6zYPxg8ZUYNgt7MS7vAQllENT/gWjOUBc
         NUkjtO73p0y06ZchiOAZBKAR0NmkPfAZ6BoVw3kxcoF87eYmiV6YGN66uIH8j6wfugKg
         0wyCXn4iAws+ZGfFmw0hBfPhM+9JsHWjG06N/zgoRM0KEilK/p8WhkB05sKl9EAl2foW
         SywtFBvUlcMwn3rMobIEFlmuLLCTcKNE8Ny1fFBkV6/ZuuPqunA9lD9YpmKegCnNI+19
         A6Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795458405; x=1796063205;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=thHuqHmooBy0uGsMcFJyj79jvgcNxfQof3z9Kg8ZrOQ=;
        b=TU7zwok2cHBkCLznkPCmVL60DoaBY0H29s7aCSmAHCwNciKrpRNIrNoaJLg0WJWahx
         IjiZJy7WjXHjUiKW//idP2MS3RILmFsJKZmcIWjqLtMdy6SuOgtbl+gWu+KRqWENlBiN
         OkzPVui9EqGNES9aeHPcszSggar5UF54ARBg1csaEOeZ7q2y2FsAEPUZMOk4Kk88fe3/
         3KUK2r5fT2d04mZ+5Es8R8eEIoOaofnTo4lZ5AojW5Q0AnJZB+RT8ezMcjqdKMYgcK/N
         dmZvedcY8625Ij6O6omcfN6kY6OQ9d0Q5ljuNlGYWLUCbBvjkuZxUJXJa2NqECV/IyVh
         uWZQ==
X-Forwarded-Encrypted: i=1; AL+hErHgRMZXUvbRkxnqtRm9jeEKl1OnECo+Jv7a8i9sdRYC9N/rOAeGYh0dazt6KlMK6Ie7oAbjlxkoMColEBQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9EK75W+Dl77YGw5EDTSXG384HeOtcErUh9E2eALONtIaIgad1K
	OW1QM8JhNqYv/ogiPjoxmPH1Lm/fT1Ydef5gTYovlrxhqfr4P4+nx4cJv9mCcYPkhw==
X-Gm-Gg: AZFdTZcQT396dByQ4amRNiEsQE8njw59Lp3q8f8jv55FVGmQc3FThQbiO5XwrToGPWs
	BXTjYIQtSP3uo9Y8soQ8jMSmPDta1grnM7W9YVdgfeD/UOAxKFAfjp6p41LXCDYgYYBr1nmE8V8
	R+VIjC5XA1GpOI74D00fCx3z33hJrbuf0w9LhLp0f5PcL+27C4PG0vuIvMnj5xMt6qsyle3G5pl
	pt2GD20Ac0ToKJ+osjl3RnMpUnEPgqWpdM/ap0UeOn6iFb6CiRLQbXFgaYPayHIS6pMkcz7pOgC
	ihnOf74drMnPVMrSUWngVvCq1b60aXc8MFlXT6JaurpLsG3KG2VHyTDTeqtV9lA3GkdWTOGC5/Z
	JoblC7ebIJwbFohV7NRdZGQVdz/pIF8nXygMC3HrJiccBQikHaFQgVmieHgtvetCD6XOZZxZ5GV
	OsYlrOAKarHJ9or/Qqp45skpxB3qN9m0K1DmQDBNU/+lgZWXPGFVTkNReODilD1n3tEu+5QKnE1
	pbjNm+AwVxWJ54lKCUYNkFtKEQ/v7bnni8VmFQpoiuc7Gl+JT8zExHuQor1YhYTITUlRLpRIdiU
	lOqj+TWJtn1pPa6Qn6vDa5X2DgJsfP7wnJpkVMwCQScxuIrkHRn6+sfqxi+XYadQpA==
X-Received: by 2002:a17:902:d542:b0:2e9:6790:212c with SMTP id d9443c01a7336-2f03f190776mr120496345ad.30.1795458405057;
        Mon, 23 Nov 2026 10:26:45 -0800 (PST)
Received: from localhost (33.79.127.34.bc.googleusercontent.com. [34.127.79.33])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f120282sm56755105ad.59.2026.11.23.10.26.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 10:26:44 -0800 (PST)
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Nov 2026 10:26:43 -0800
Message-Id: <DN2SVVWX66U1.37JRVKARDRNYN@google.com>
Cc: <kexec@lists.infradead.org>, <linux-doc@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <linux-mm@kvack.org>, "Alexander Graf" <graf@amazon.com>, "Andrew Morton"
 <akpm@linux-foundation.org>, "Baolin Wang" <baolin.wang@linux.alibaba.com>,
 "Christian Brauner" <brauner@kernel.org>, "David Hildenbrand"
 <david@kernel.org>, "Hugh Dickins" <hughd@google.com>, "Jonathan Corbet"
 <corbet@lwn.net>, "Liam R. Howlett" <liam@infradead.org>, "Lorenzo Stoakes"
 <ljs@kernel.org>, "Michal Hocko" <mhocko@suse.com>, "Mike Rapoport"
 <rppt@kernel.org>, "Pasha Tatashin" <pasha.tatashin@soleen.com>, "Randy
 Dunlap" <rdunlap@infradead.org>, "Samiullah Khawaja" <skhawaja@google.com>,
 "Shuah Khan" <skhan@linuxfoundation.org>, "Suren Baghdasaryan"
 <surenb@google.com>, "Vlastimil Babka" <vbabka@kernel.org>
Subject: Re: [PATCH v4 14/19] selftests/liveupdate: Test which tmpfs files
 can be preserved
From: "David Matlack" <dmatlack@google.com>
To: "Pratyush Yadav" <pratyush@kernel.org>, "David Matlack"
 <dmatlack@google.com>
X-Mailer: aerc 0.21.0
References: <20261111002358.1842967-1-dmatlack@google.com>
 <20261111002358.1842967-15-dmatlack@google.com>
 <2vxzh5hb1sqo.fsf@kernel.org>
In-Reply-To: <2vxzh5hb1sqo.fsf@kernel.org>

On Fri Nov 20, 2026 at 6:29 AM PST, Pratyush Yadav wrote:
> On Wed, Nov 11 2026, David Matlack wrote:
[...]
>> +TEST_F(preserve_tmpfs, frozen_size)
>
> Nit: This test isn't really for "frozen size", it makes sure a preserved
> file behaves as we expect it to. So perhaps call it "preserved_ops" and
> update the comment?

Will do.

>> +	EXPECT_EQ(ftruncate(fd, page_size), -1);
>> +	EXPECT_EQ(errno, EPERM);
>> +	EXPECT_EQ(ftruncate(fd, 4 * page_size), -1);
>> +	EXPECT_EQ(errno, EPERM);
>> +	EXPECT_EQ(fallocate(fd, 0, 0, 4 * page_size), -1);
>> +	EXPECT_EQ(errno, EPERM);
>> +	EXPECT_EQ(fallocate(fd, FALLOC_FL_PUNCH_HOLE | FALLOC_FL_KEEP_SIZE, 0,
>> +			    page_size), -1);
>> +	EXPECT_EQ(errno, EPERM);
>> +	EXPECT_EQ(pwrite(fd, "x", 1, 2 * page_size), -1);
>> +	EXPECT_EQ(errno, EPERM);
>
> Nit: Is there any point in matching the exact error code? Wouldn't
> checking for a failed syscall be enough?

The documentation that patch 11 adds to shmem_luo.c says these fail
with -EPERM, so I'd like the test to check that. But you have a point
for the other tests in this patch: the documentation only states the
permission rules for preserving a file, not the error codes, so in v5
those tests will just check that preserving fails.
