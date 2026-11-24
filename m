Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795486069;
	b=1Sjd7MAVZgd5up8LhZjqcqCSnOKQUHbvOracFtRP+qyrdORclNXoEeWVJR1VlnmAu5Jg
	 HMtkrX4Lc9TY5UAFr5T7bqdC1VKoy4Y4LEdeKg9gAghpgGI+p1P9O4Rx/DJ3Nzn8wYlD1
	 LYapTVBp8T4/5Oc49N/7Rh4bH48t/Ni2B1tKJujcxX97eLDUX+q7NFH+2VN1Frkw8aKKK
	 YaYqht9yr7RMgCzvVazWeV4X/gE5bMXmyPe11xfF5UwY6dAF5VqpJb3ng7aZd5l/Wqat+
	 B452xznoPenHJZG/6Qqg6H3HtC/gXdxb26zkg0hZtn5yauVUmP/nhIoEUX1NcEooT0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795486069;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=tFsjDglBz2sLHJBnYNxApGyWnv6OFaPjXU/RiTo0Pvc=;
	b=vsZUSsynbnEdXxrnTiB+7xDaWwBwPuPzG1CPh7xqa2mz37ESxMxFmFKMiIgrJ3vkhiyK
	 pC9VhRr5W7Dhp3NU7VQAz/MkcY91at9zCBJ7wViqi7KWSP94C4ym7BPhEJJjMrvOpDhrR
	 A+7/yNd2Fh5+8tsBwSjiC1Xnd3kuP7yEp/CmXd42BiIDVyDYvs5tE99DldY7Jchl0tXtk
	 eviWSEN0rlYS1jMbRR7WGJoT7vV3i5huGgIB3aiE3QJ7nj5hqh5zNHEDTAJRq/nnAaAlV
	 VlEhalPNFZxI7FzaFQdyIzaXIhrGCxN7KwNBTXeA+F/ws4SZEv0Kty27hS0rKnr1t/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JF4gmG4C;
	arc=none smtp.remote-ip=209.85.216.42
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0AD4606A322
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 02:07:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0AD4606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JF4gmG4C
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3ae6b4c669fso4037532a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Nov 2026 18:07:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795486068; x=1796090868; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tFsjDglBz2sLHJBnYNxApGyWnv6OFaPjXU/RiTo0Pvc=;
        b=JF4gmG4CjY+JUN5N5fqodx7XPFpRqlNeiV2CRJpa0nzSwYvFMmGcMy3VN6ALLcIwmc
         aYfVvEyizAamftVUlPq8ZuaZ8JIiq/UsCbPvWyHdYPH9Nw6Tij4ShMXLoqEQo7l1aWgW
         gWV8O9Ug6eM2lFNyJcYYQtaAUJQmeqCrVuL4y3OkNAJesGqk1CeNbjZQ2xEvwJgcdwj2
         hMxVvd0q3Ihw2HM6WeuEOjOTbK0jY49EtCB6PJMalSOANHL+uZVlZtXoV/3kr8HqyIUJ
         SJaJxud9ZzcRjpvHWQ28fHiO5caHsamUL0c2082Y+Y0taBz37FISNZA+puTQnuiVQdAC
         XimQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795486068; x=1796090868;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tFsjDglBz2sLHJBnYNxApGyWnv6OFaPjXU/RiTo0Pvc=;
        b=pmGGorqoIJ6deQABIhs+wVPJMLk4INdZJnmSrFVk2OtljVs6BxqUjmIpogar0dbIGS
         uwt+OPBhDz0Bq0O/HjdV32PM0s5HD6PfSr4iW/u2FmJuuUM8wWzWRjC8ki2ZgPioWuDw
         yvId5oV+jFHcQHtmiTHRgDzjqT3J9NMQ3duJIfkULgOa2UnnkmQC9si6MqJZwXHqkr6Q
         DDMtfj3eeN7eXzp1VLi2UPWEh0W+9iH1cgUF82Ac6KIy9pONnvctEDWkg5vZupFC+9/m
         TpvNa2v31ygmOe2ase0M/N5EA5TGDla/y6SIEmtonEwRD2YxuJB0uXKO9NwzDzkNliAI
         tkOg==
X-Forwarded-Encrypted: i=1; AL+hErGU2R+JBE/g6r5Iir8qdt4R5EYOONGys6IleUX7uZ3mbQ3IuiYDYAXaLZPvmS8GN+5vqUM6xsgolfWozjo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9wwhsTFgW+9Cwju86v4bN/Ho3kCVqzs1gCzyPrfSA73kwqXSAR
	8XLS0oj6EiHRJ3T7/DkNwXuphvEANhwCDU0YA9aFs0vivRdLmMHtqgV2
X-Gm-Gg: AZFdTZessbxwxM+Gu/sO7iGJ3TfO3+K0lS+LcBPojJQkGB1ioy4kP2sUx8SqybdZfOy
	BKijcQqB4Y73ApeOcMh7xHh1cOjx2+HQfSt3DmCg8yu0acobO6JlG70GIKKUht0sxVA8k+kFsZg
	XwxvDzXCIPgNvqrlM3Mphdawx0EyQubOhfMNRLTFf8LveUtJiFN36dB5zwjnwk3MO9qVHtZRA0l
	3bo0Ye9P6uudxJ3L9bqs3RHVpemizxBtmYuHaXduXTdX381OJTICve/TEq4ko98DRmVlFGGTJEJ
	gc1U4mfV1wqDrsuOTEJfeWG+sR3K+1b/UXB6gM/hTtumi2InsQXzOx49xEtKXYTtz0P014Q/1Oe
	nWoeyM0XaAiniYER8keD0EECoJcU6/pBnHyZSs4wjGTO+YJZwF9ee7wgo/ap/SiVgswcsXorb1O
	ypIOIax7mRchXPtMoDw2eSSkmNeyijJ5pPPusYvKW4IP9kkDUS87cKyLdFBoH/vkL647l8lv2Dl
	FSbnBPVxhKjEXRbbAoMtYfn0EzhOjuEXC81GcJ/0ZF3dQ1jE5O2AMtoCIldsvJ6kHZEI7+Jw/Vu
	PRJi6C3HvT/LY8rLN4UnC0wfv4njGTaif7VHvjWRy6ZcFWeh3BmD3ar54QijV+3vEmvu07qpGdn
	XUnsdlYheidnBUopZgwAHspJ7dtVGX36F0Aw7DioyYjebUbey9dI1MID7D2fV5lNOz8G5Ig7gfs
	RZxwFCqjWKV+CY1sJQZ7AssbdjmlfxE/rS+dU7NtqgnTAmqfuigpOyNssUaXZ3T/+Pvo56lExcJ
	blCTA1NJeQA2M67ZPOZfh07D921uY9uexPa/sIS7cDbusupqah+lo6e2lJD3ACg
X-Received: by 2002:a17:90b:3f8e:b0:3aa:412f:b0a7 with SMTP id 98e67ed59e1d1-3b41c7bc85emr8498556a91.5.1795486067648;
        Mon, 23 Nov 2026 18:07:47 -0800 (PST)
Received: from localhost.localdomain (27-32-254-230.static.tpgi.com.au. [27.32.254.230])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b40f4312dfsm22054844a91.3.2026.11.23.18.07.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 18:07:46 -0800 (PST)
From: Daniel Wade <danjwade95@gmail.com>
To: "Chang S . Bae" <chang.seok.bae@intel.com>
Cc: Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>,
	Andrei Vagin <avagin@google.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] x86/fpu: Put non-enabled dynamic features into init state on sigreturn
Date: Tue, 24 Nov 2026 12:37:26 +1030
Message-Id: <20261124020726.152-1-danjwade95@gmail.com>
X-Mailer: git-send-email 2.39.0.windows.2
In-Reply-To: <188d736e-8d8b-449b-8826-d6ff72800379@intel.com>
References: <188d736e-8d8b-449b-8826-d6ff72800379@intel.com>
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

On Sat, 21 Nov 2026 14:08:21 -0800
"Chang S. Bae" <chang.seok.bae@intel.com> wrote:

> Hmm, since this missing ran into the issue, I suppose some fatty comment
> here is needed and also with some clear distinction between two.
> Perhaps, something like:

Yep, makes sense to me and it does read better. Shall send a v2.

Works out the same either way. Ran it on an AMX box with Andrei's
selftest and it checks out.

Do you want the selftest in the v2 as a second patch, or better on its
own?

Had a look at trimming it and I think it'd be hard other than the
comments. The two xrstor helpers would need a flag to merge, and the three
forks all exit differently.
