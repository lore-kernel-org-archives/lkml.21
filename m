Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795376316;
	b=fN9GwS6R1+WuHfiTjPGhBVoTE8KTdwhBxR0Y7dYiJCLZ3DiSrGhm4zJKIE1kYxQtM+8u
	 Exdz8gjs5AaLckMmBr21G0TcNJTFwnkIhEE+mjccuXvyavw684TBoTreR3AePmi4Ifwfh
	 T5ODb7N94V/RtAbwdQWHgh7CMw8YQ7/5RIEDhNDo15wfLXSJ0ZIOASDCNJI3DMb5+l07n
	 +W2Cf0mjxSvZ5V+yOWLt5gNhpM3/DvRnwpBB5/LTUAKNt49VFUDhVKP+vLed7oKjJYTFc
	 4dhHowuSX5XN/b5TCcnks1oGL19vXZo9w1JIsvOR0JTOOfr28GqSgFm+WgAetim2tPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795376316;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=tcHY8ySguSV5bs++kGDNGH1lzJuHpk5Uq6ws1QUg8Sw=;
	b=0QfBbjH/Yife/0wnPXLgqHf0ZoVM/rjOC68SHzXQIwUnnAzIVuQ1/HBYV7ajFosFfbIK
	 sDAMtdWt9Ztyh0cJLM5VS6pqBrFajAPwACbg3lloGGQcLACvaVlDvm5yW0ZKJuzP+/OqS
	 oARvObUsu5wGhpzBlz+9SGj4J4eG9AMTNtdlqIo4pY7HnT/ib6VWI4XN21eorCTcuuLhY
	 nh1yr2MbN1ogkOuVdARQN8nWsZP4mda3w3c2aS43Uju/jSUlE33fXjbPDDk2/OG2QJBIH
	 gMVz3x3JLTJ93CG0kDF9Em0tMMpo/dhvyur6NxKUrF88NJwgdHb5kJRrVnWyrFFJuNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Ii5GvSEA;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=B0Vn3vMi;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 252B4606A31D
	for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 19:38:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 252B4606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Ii5GvSEA;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=B0Vn3vMi
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795376315;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tcHY8ySguSV5bs++kGDNGH1lzJuHpk5Uq6ws1QUg8Sw=;
	b=Ii5GvSEAc5Zv8CwnmR3bv5Bw4b5uq25w+Bt8g9veD9DxAFzJ9FjdSvjpaMOcIA/rCRDm5N
	qo9Fh+4NabsHNcnfHn4tf8Na8tO1TDyGqliYnjNppz0aXmnK2jAfmus3nHzv5+bTLtNbum
	jdYVm8A1XMPxDHznJBDKWXud5+LXg+M=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-674-luVCItH9POSvCZA_j6fRIA-1; Sun, 22 Nov 2026 19:38:32 +0000
X-MC-Unique: luVCItH9POSvCZA_j6fRIA-1
X-Mimecast-MFC-AGG-ID: luVCItH9POSvCZA_j6fRIA_1795376311
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-6a615ab0c06so2660898a12.2
        for <linux-kernel@vger.kernel.org>; Sun, 22 Nov 2026 11:38:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795376311; x=1795981111; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tcHY8ySguSV5bs++kGDNGH1lzJuHpk5Uq6ws1QUg8Sw=;
        b=B0Vn3vMievd8S1JDBAXzMOwQbWpX3ytqBuazD/8HjinR6Fq+7fXce83cRgK2gU9HTA
         ev2JpY9Hb70SgWOmTU7mnWsWxVuU2NwoSM/bYnkz6QpZ6yc9KV7cAGGDBc/jAxFgEK43
         idweZzF7ZCcK0z1zT2yqpxHI8qnxBWtsFg6oQ57B+8MbAPXIx+yzu4ZOtqfQrSRNVM0Y
         cROZK4M/AmehX7M0tcOnnVeT7XTUFwd+r9f1R5kYVLO32u87ddQV4Hg9bmlobpXDcnfs
         27TSGSQhcPT8NJdyJVKBRcAzfX01s6n+Jv1x8in7EBbsb20GtTEa+LKzb+HQQFrcmy9O
         FdYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795376311; x=1795981111;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tcHY8ySguSV5bs++kGDNGH1lzJuHpk5Uq6ws1QUg8Sw=;
        b=soNwHs3NElQh4aCc3i6T6ujW1QvAhGjxYzZbSb2qnLnm6Phh4J8skzm+YoISoM1GsF
         yqAkk8kw9qKkoJx5FCWc/9Biv99S73VK48a3iOB4/jjeNYRpdVM+fLbxxfFttNKycOL9
         e6bQk4Tpkez9xPjVJkA9n4Ack3laP2jYJyBibksiu7YWfDlaeG6KC38zhDdz9Y4pI0U7
         fCMEsFBKK4BL8nVl50Wp1dtAlPq7RhOgPo+2WJPvY15KJm00iPGKRB14/u5bdmvIh3AG
         gYJD2r8SfZqZIj9fhL87vHjb3XkdSGVwHWyceAN9gCl0FruxltRhyxKOzM3RUOPY+Fv/
         IBTQ==
X-Forwarded-Encrypted: i=1; AL+hErHBH2S09GnTq9TjeXjVY420i5Uk77AxS1z8aweSo7Quahq0h+z+F0YaCMZhEef++oPJP9v3VrkFgdOzTeE=@vger.kernel.org
X-Gm-Message-State: APuU4Z9RUHF/sZFDnUj6XAiYs9WXG1ebP5Gu/txCIScEvHBXnfoyx5aa
	JahJur+ojcR94wc65vcXcXvBorwKJyEDZrG4VQVHIJg0POr///FYJBEsJXUmBhoemDbcz81CLAh
	2fiURsxowRgVHNoHHAjbGG5qjcq9t56D4HCrCEx//8PA/CdkdKf8ELp7HMYyvmrRvpQY32kOTB/
	hQ
X-Gm-Gg: AZFdTZc7M/BYlm2LmLju6xf8Dthx8+b05L5m/oIeQEAOcACcy/983g9itRCAtquocA3
	Ie+4KaByMw8TfTyhOxVD1KV+BchQ/zQDlvmFZVuDZlNmY0iyPz+zalcvV3tR/2yw2cm9Cq4+WmC
	CJCoDhG86w+2RFk0JvjGv988Awy3/AvfZyOnp+yBDDPpYHD9nHKYvPI6KBUemOc9gE0stDv4gCs
	FcCa/qggcZztfiFChiXTzhgy2DLyUCmkwUBCNIdRYznygDA5F1S5l2XY/aJ1nA6a1XV8nqL3j9d
	5b5a7X4qAr4TvC3uCEgns0tFF32/O5YMD0PBIvF4S/scr3wjD6YujvGeMjurZs3dAHiyizGLL8z
	A4FVzpLEHCUF/fc27EG/4S5w+3Ft04WiO8NdwhI+t9NY8HwHRk0YnABMWG6YgUmSYaI+dV0alnR
	NhDXxDKdDFtlFBvugfOefdxG7Mz1LORfCbe5hhS+1h1tRFMs4xF0/YXYxKAX8gID9sCwRpkq77f
	z4TheAyAz//0FYd4aiBc+TTMiTFFJwtKlrSrmb+pBC9EkyA1gIt
X-Received: by 2002:a17:906:6dc1:b0:c46:9876:e9b1 with SMTP id a640c23a62f3a-c513aad1c20mr553233466b.43.1795376311435;
        Sun, 22 Nov 2026 11:38:31 -0800 (PST)
X-Received: by 2002:a17:906:6dc1:b0:c46:9876:e9b1 with SMTP id a640c23a62f3a-c513aad1c20mr553232866b.43.1795376311100;
        Sun, 22 Nov 2026 11:38:31 -0800 (PST)
Received: from cluster.. (4f.55.790d.ip4.static.sl-reverse.com. [13.121.85.79])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ad01afbsm342072466b.5.2026.11.22.11.38.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 11:38:30 -0800 (PST)
From: Alex Markuze <amarkuze@redhat.com>
To: zhangdaolong <dlzhangak@isoftstone.com>
Cc: Ilya Dryomov <idryomov@gmail.com>,
	Viacheslav Dubeyko <slava@dubeyko.com>,
	ceph-devel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ceph: fix inode and i_filelock_ref leak on file lock rollback
Date: Sun, 22 Nov 2026 19:38:28 +0000
Message-Id: <20261122193828.1324376-1-amarkuze@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <1793858040.6AEC19F5.003.4jKs1y00vLz3CgW@fangwg01>
References: <1793858040.6AEC19F5.003.4jKs1y00vLz3CgW@fangwg01>
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

Hi Daolong,

NACK. The rollback leak is real, but skipping fl_copy_lock() for every
unlock is not the right fix.

try_unlock_file() removes the local lock before the MDS unlock is sent.
The temporary i_filelock_ref keeps the auth cap from being trimmed during
that request. Without it, another cap can cover the bits the request is
using, and the auth cap can be released while the unlock is still in
flight. A second lock from the same client can then be granted without a
new auth cap. Processing that cap release removes every advisory lock the
client holds on the inode, including the new one. The new lock remains
installed locally, so another client can be granted a conflicting lock.

The guard in ceph_fl_copy_lock() already stops a second reference when the
request lock is attached. That covers the rollback. Please keep the
reference for an ordinary unlock.

Thanks,
Alex

