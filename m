Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795803384;
	b=BS5QQ+qeoE7pAZJ8f3Klb6B5Lq+KQ4IZj9ertoX/qDF5I0ZgPKA9qwIk0V6z3GccTeMi
	 ZO4/fjUJ22ek0xS9HKIj4BJqE2LCICtUSohyLM8sBCHm/KPbJQBxEBB1YtNmefqV8bbKB
	 LYwKiRv9EZkbS7ZyGFNJmDkF8YMhvyqelkecRcEj6NXrfnChc7tm16KT6ZMqRMOj5wjeJ
	 GD5kdFAoQCaFfBfddXctWln84OyMSIETCTWQBAYnZ9wEQ+rHhBbkfhCpX+zBOlWnstHa3
	 YYIZetNWHoEdd5/LXmZP2DeQcoaDNo1XSjZA/gDLBPVTJizBUFi3YgH0h2WxgHqwQhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795803384;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=KIy7TZZfhfrJECmc3jAKv7NlnAuyqwv9Lb466qTdbJw=;
	b=KX1gCy0/sMt511QRpDm9aaoetFsmYL3cDCzg2mKl6voUfC+PNMAbD7YCz0Lf0E87glWQ
	 w/esM90EhDVdmxJOKVst0nS6/SD0QdKqee7qkekfSz6Rz43y6hjz4juMEUIcjZBi8KLRa
	 4up0gPQVIIajMBGfeM2GuNlWsl+SmgSK/v9A6T31t0rXU3reqTLV4dWV6yoMnH+AMfdKA
	 X1d6nPJWOjzpRiRpdaWFDzDx3Gue7YnOTuCgSsP2qLMNqPtTwu3I+sv/SC2fT3N5MtolL
	 i9nrXlZfT2GesWcmBp+w6Qki5OCy2yJxFn3mK0jSIuPt7XH/DE/Oq4MUU2jk38smwmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PQDDU42Z;
	arc=none smtp.remote-ip=209.85.215.172
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CFEE606A31F
	for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 18:16:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CFEE606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PQDDU42Z
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cdebab6fdb3so1201741a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 27 Nov 2026 10:16:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795803383; x=1796408183; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KIy7TZZfhfrJECmc3jAKv7NlnAuyqwv9Lb466qTdbJw=;
        b=PQDDU42ZgVj0QoQ4uepU/7BP4KlD4Nn2+zzFk0PAhAz1Yef2HrqqTHLasU+e0E03L5
         d4EhvDveddYJ3mfG6iYfkMrDqwkcxRoEdMnm8VnEgDxTZHOogSzUIy5jrkxiU2zr8ndy
         PW/29QqdMV/IgOL0+ytSRIL0r01SrWM/vciOyue+nHvGAaDPnHGuaIcOl5YdfI+gPCwd
         4K+mySS/LVXfZxIlUetIT+KT/4vuPf3FD45/9hD1t/NEP3mdfcU7UW+t7/iQH8VKd+bY
         5DUU/eUl+xCvI60fz0PycQmdxyhOV/3AKGuH47glh6yVTn1SV0LzDObblanrCGOVPYH8
         gVHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795803383; x=1796408183;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KIy7TZZfhfrJECmc3jAKv7NlnAuyqwv9Lb466qTdbJw=;
        b=ke+Zi/pH9XrZFYVQtqxq0fVmM6NOr33XfmD+Z4snp2yUSIb84UTn8oMCbcPMvdCQFc
         ee7F4zfnjew7em8R4rKcjHHWGgQfq2HfbeyEInaJfFnfICrjR2e/7XHgZfnusUULufpC
         k+nnpHjoz5UR46OKjASBHBUCn3oX6YRxaLoDgKOEWrfVxN250jRWRZozWpsACrGr8uEx
         HJDri/u2HwmeVIUC3nsKoSWOrkOo6pRwN0gV4q1MH12msGsz9/Wi0dvP0eGgAwlz1z6W
         eV3KAwVZI6aMw5cXs+gadJI/zpEBf+Ob4JkBjJis7oa2ryfpI2P+RulgLvJPSQqHqo4Y
         Ap9Q==
X-Forwarded-Encrypted: i=1; AL+hErFc0yDpmED5reBXCk+8Ca8Oe7YGnEcgN9Sw8KLe6t5AU8TG0JgAX3T9D8mGnyOy4+qDLba54ZPhmMoVP+s=@vger.kernel.org
X-Gm-Message-State: APuU4Z84xpHlPZ4ij9hphZjk8Awhl3q9foRswbfqtOPkcJnlZQn2EL7G
	gX1JXBWUQUyfOhuvl9FWh8+sQpSbluMvUCppFWMHyKOVbh9+VvAgrzwXHZnjel8TI58=
X-Gm-Gg: AZFdTZdx71EXHxv4LfrW5psD0MrnFT3KIJdxLqjij4ebMFTJFkEjWK5inAODnJ2ZJbq
	rvMi4JrKQY3SnyrEQjnw4sBGJRw/LxAMX3dfIk5GHDEVGKLVwIpxNyrlqydbMxBKxxl/TdncJPj
	hcmWVmLQPXBmSpUtAhPzrKAXK8mDBP9hXsPdnGEAfJsZhMkjZbTk8xkSsKVI66U4G/iB7QKM1Mr
	t+FaWzqdtMVJaMWKSqqLCFkHQftEU6JQwPxSLB9tkR2LLR6PfIj+CHpArlErEAQeY3Imxb5Tc7h
	h+uVMvAdB+ZyZJdTXYRQ0IHkM10cFRQ5Ixq9MQFHvxKA+RDULXQAGdU7fzM3EoBbJTtoU2THWLA
	2Gvbd7zKBUvWq1oy3bDpJdF4X0f8PnR7HDOPxmnMEruCf9YYfKeT0pYVaB1OaDa7G+jThuW+Lzg
	Mn4MNUD1hoXjvWLVRgHsMWDT0g3lED4lUoweuNOkdbV9AMWjQhaSekoecDARZaFkPJmKwNcciQX
	xDrt9lJG6u7dSUXP3vlsTTfD/pKVPXqBhbKqDo3row7u97dSqFX+iGCWpYax5K+izlx7/6ubOeq
	9vhx3qgzdrx/7gPG/BTtgKapworHw6N4K8Ka5j/KPA6NB/gnZg==
X-Received: by 2002:a17:90b:1dcd:b0:3b0:bd53:8e5d with SMTP id 98e67ed59e1d1-3b41cb3e4b9mr20027678a91.58.1795803382825;
        Fri, 27 Nov 2026 10:16:22 -0800 (PST)
Received: from fedora.tailc1fb0a.ts.net ([172.219.65.15])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad92c07sm39867121a91.13.2026.11.27.10.16.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 10:16:22 -0800 (PST)
From: Artem Novak <artem122novak@gmail.com>
To: linux-ide@vger.kernel.org
Cc: dlemoal@kernel.org,
	cassel@kernel.org,
	vireshk@kernel.org,
	linusw@kernel.org,
	linux-kernel@vger.kernel.org,
	Artem Novak <artem122novak@gmail.com>
Subject: [PATCH v4 0/4] ata: add missing newlines to error messages
Date: Fri, 27 Nov 2026 12:16:15 -0600
Message-ID: <20261127181619.183139-1-artem122novak@gmail.com>
X-Mailer: git-send-email 2.56.1
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

This series adds missing trailing newlines to error and warning messages
in four ATA drivers.

The changes are formatting-only and do not alter driver behaviour.

Changes in v4:
- Rebase on libata for-next (3391ac405dca).
- Resolve the pata_pxa conflict while preserving the updated DMA
  timeout condition from the new base.

Changes in v3:
- Carry Damien's Reviewed-by tag on all four patches; it was
  inadvertently included only on the sata_dwc_460ex patch in v2.

Changes in v2:
- Fix an additional missing newline in sata_dwc_error_intr(), as pointed
  out by Damien Le Moal.
- Add Damien's Reviewed-by tag to the sata_dwc_460ex patch.

Artem Novak (4):
  ata: pata_arasan_cf: add missing newline to warning
  ata: pata_pxa: add missing newline to DMA warning
  ata: sata_dwc_460ex: add missing newlines to error messages
  ata: sata_gemini: add missing newlines to error messages

 drivers/ata/pata_arasan_cf.c | 2 +-
 drivers/ata/pata_pxa.c       | 2 +-
 drivers/ata/sata_dwc_460ex.c | 8 ++++----
 drivers/ata/sata_gemini.c    | 4 ++--
 4 files changed, 8 insertions(+), 8 deletions(-)

-- 
2.56.1

