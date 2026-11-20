Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795174929;
	b=E6nTOt8pkN6Kjt74YUQVsD01oHBDKHhkdoEQrS19oVicetqaBlsV7KSCE4MJa2EBR5gM
	 RlhSUHy3osCih1u3kQYLmkbgjRV/9tadhHlixcpg+XzXUcIYEzsYO/2/vgrru1aP4hGpP
	 hdVHyCdJc6YbOq1mNQ3dwm69rZhN6RWrrKuAKbNHfeImX+tH1sHtyyvvUUabofNXtBQSx
	 n8aFdrvja1wixXRjnuNlN0Tud0zwHuUVLUkNuJrwqf7k39AoONQqHFvLBX6vPzAn8wI6R
	 l1x/zzlYGh+9sCdHRwSeQbXLV5bUhWq62Myb3mF+QFnZFLAvoj0s6Xq3Vb0kGHypv1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795174929;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=tM9naJv7UO6Voq+aBXlPWHG73U+ad6C+ZL6d3U3QEdw=;
	b=p5tjSXRjGXobYIxFQAb8iCFuNzLh+0vbnA1u6Oj6EGtIoE6S1Kf5BvCSYI4blwK85Syv
	 zbrdBcxcCSAPZoPJICdFPiWZN3fysGp2YA0n5SKG9aEWmK8csWPRus+qcjcm2vq1EMB0i
	 cGHrVFsgDlmTaa8TkY/NWfTEbMJXguRJWzWn/mAjJ41f2Xw+eFWwy4dbaOgBu+fGuBRjE
	 acskhRKSbzCjRqDe+mnC2UA+dBJkhIGk5UrxY6i600ObfHg93wjCPlSneecQKJxx2zmNC
	 T+sA5NSpZCEGASJe0ZjmvcARz/Z5d6RC8pfhZgVjQGuAt1X+Bp3ePvsjk8RT0ebeKXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=isslab.korea.ac.kr;
	spf=none smtp.mailfrom=isslab.korea.ac.kr;
	dkim=pass header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=WFYq8toA;
	arc=none smtp.remote-ip=209.85.216.53
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4567C606A326
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 11:42:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4567C606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=isslab.korea.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=isslab-korea-ac-kr.20260707.gappssmtp.com header.i=@isslab-korea-ac-kr.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=WFYq8toA
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3b3d4d3bba3so466034a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 03:42:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isslab-korea-ac-kr.20260707.gappssmtp.com; s=20260707; t=1795174928; x=1795779728; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tM9naJv7UO6Voq+aBXlPWHG73U+ad6C+ZL6d3U3QEdw=;
        b=WFYq8toAzjU9exok8ixcfSZNb3P0glxTUSaEy8hOf+NhxldDGjaaUQwOSER1rPEBd8
         QVxRWO9De4zA8neTAaFV8QZiT6CAnxQnVr6liQRdNok4TCWdeBlKaEkLG3ptWSAugg4u
         J6AuIB/qiVgrTGjpZEW8i3D7di3Js9zoDxfdz2nwrbVhfh4PNrHGnQkB7Eeamo3vhoa7
         80LyErUdXC4vRCHTF/UoGbkFOo8+XCm2uq1wVbErarOv34E2c78I13V3iVYCGaqzN+m+
         37GLjgXK2Ak9gI89G6EZrdJ1guooUm2uK9BnOyaVlV5xYA1EvIRAu6ZoJsdwpCgoEvyt
         UTcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795174928; x=1795779728;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tM9naJv7UO6Voq+aBXlPWHG73U+ad6C+ZL6d3U3QEdw=;
        b=uKG677eAk1JodAiZLn4kAGpQraryI9m6Q/uVHvisP1G9ZhUoLDml/7bSBEwsMKoet1
         /s2Nxc9dskAMPJR+9nVaE2QrcAWYEC0QeKaJ3E6jIjzgOp0I9YknbRM7jy6Y2OKoE3oa
         h1u4+8X0lKhuzvhBRVUietMxJJ1xeo8Juvcpw4pySrnPn4U4PPyDtkrerzO+PhfqEFs+
         n3HHSx8r6b3JV0/gosyvSAd0vyGC1n1Wee3KM7mzricRS+Iemzw/04I4mMYfz0VbHWZp
         Jcca6unBUMmLQUuGXFY+1pvTI67O7afDlzAfHZIgnnwptUa0BQpu6jNwM2K378mha5Os
         kVew==
X-Forwarded-Encrypted: i=1; AL+hErEr2eJCzBUHjCn0OF8ImpQ/Jhuc/RKX+pkoBaS6kdnpkDp5tYzobBHBJezTNSlGsE98MBcZ5158lm86/GI=@vger.kernel.org
X-Gm-Message-State: APuU4Z93NLq4n9z/43qkw5BhlxoRjyAImP+fYIN3WD7jy5Ew4Ae0M+W1
	A7zWXQXOBGK+lrElCxiiJdJZPR5qUJZ9ToU5UHA3FsNaWHg+T3eTT3Wck4wqZOqKoAU=
X-Gm-Gg: AZFdTZfxue6uwDtjo4rjQlZ0EMq2vIuo0vAVJkhrLL6QYe99KkG/KprdfV4KCP5FiWM
	ESntrXmpdIfonZoZPuk9/oRCooBOu66Smb3LwqL0x/kFNpkWuYYWJ6MfvVmzdyVjDIk7ugd9kE2
	UxgRS0AwfFekrrZLUDsqJRM4CUUEpUSU4/uj4Vt8vrP2tLhCqRtkvUXgYr7PihxTY2OKvMSp0QU
	ilCxjvdthHvUlhGP4ityBQrs8O2zmF5yZE7LUjroqBBVivFG8dNOxWszCGKP6nq85INmcJtaCux
	xQq9W0KfGvvPIMXu3QsEo/u0pI0SuQ/PPfEn5GRjkGFpvExG7HipNB8U7YY2yZaKuOh2iVasJUA
	/8w1rgeJxD1at9kMFjv0kXzFc+/tK3A9tl+PsfkBmVJu3PXzBHY1fsHlOXBFXp7Xlo1Ya87lGvc
	X3MrpoTP0EbWphfJ67yV2e2686Y3mSAcS+aXAPttJQBp61V1Zx763VqgH3jg7JST6mbNs0q0qr9
	6SpdIp0wNlemAtc1onB2ZIldmPP40AxkTEXig9whZ2VusajeJA5tLDE0P1SnGZcYHSmWZU3r3uC
	PPpcI1vpvK3hcfb01xcbYEY9CeYpjJW1TYyOQ+7OTW/5O0+L7BKcRUqJBAIhOSXpyF17UA56Y0S
	qAokVndQwTaJYIvnSapO0gki6p5BIoQxsaNX8
X-Received: by 2002:a17:90b:17cd:b0:3ad:25f6:1dd0 with SMTP id 98e67ed59e1d1-3b41c8fe29cmr2476643a91.11.1795174928635;
        Fri, 20 Nov 2026 03:42:08 -0800 (PST)
Received: from yhlee-960QFG.Davolink ([2406:5900:1044:110c:8b25:951:ad8d:5cc1])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b42ab9c2dasm849879a91.1.2026.11.20.03.42.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:42:08 -0800 (PST)
From: Yehyeong Lee <yhlee@isslab.korea.ac.kr>
To: martin.petersen@oracle.com
Cc: michael.christie@oracle.com,
	himanshu.madhani@oracle.com,
	ddiss@suse.de,
	linux-scsi@vger.kernel.org,
	target-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] scsi: target: Fix NULL se_tpg dereference in target_complete()
Date: Fri, 20 Nov 2026 20:42:03 +0900
Message-ID: <20261120114203.3072082-1-yhlee@isslab.korea.ac.kr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260725084939.694403-1-yhlee@isslab.korea.ac.kr>
References: <20260725084939.694403-1-yhlee@isslab.korea.ac.kr>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This is superseded by v2:
  https://lore.kernel.org/all/20260725165818.769963-1-yhlee@isslab.korea.ac.kr/

Best regards,
Yehyeong Lee
