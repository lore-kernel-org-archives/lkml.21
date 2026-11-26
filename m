Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.2
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795655554;
	b=K91DtOfpLUmVr46vIBSegPhb7Jq2KGLEMn+/T2dtnp2/h9gOHe05rNIydOq6g9NFFr8X
	 1K2YUo317RE0BfLiAcxr+Wlnn+J1u7bUe7UQMlNQDNxxFHgR2yTN1ynyYvTGOZWAM7Aes
	 DVZ5pruY+bB4sAN5sf23F9T8+hm4Ex/hkAhQGmF2WPevNHXZFODFg5bTocgVRDpJizCDG
	 OjEZz7GhvXDmpQZ/6ZKxI/vhIOfb+EmzY+Y5ZAUN3XbveJ0etRMP1CvkkJWYFXxMPvIoZ
	 x1tletUYRx5OgTLkt1VKuDNQciw7Dibcnoz3jdwQLVi5EPij1mEErgVxgI/uFjeLAuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795655554;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=c7j3FwDOAI6nNbfO+ghW/xE23uGn+Fjwx2xqRw4fD6k=;
	b=rl0nqTm+bpZqRbu11J+WLNrFsUuTc0emou9dR9+KE2OPqmRLzNHYwH2p5JRgblTjXY46
	 BS9QjuWfbqO/IaDGyJLrSiAhqCNuizkvB2kkwCM6t2DSk+VYCP8/fn80WSQ3BuuzN9Tw2
	 dWcRGrzG92b2L4KJ4nRojYqbocsoEpJ5+CbZ0QOci30UKp++79AFUC3m6SFYpJdwt+XKW
	 SxDII7HblgIM9dTrATHbO0yTIcn39vII+aHzG9KGm8+0zSJK+72Dy+1sEXNNO4+bUDgiI
	 JRuzL2HdlqipWSxYUrFimlmoz4Zjz6MqajZTRM8Io2Ru6JPL5PKRfym1YHyxiWKr7Ug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MK3QUops;
	arc=none smtp.remote-ip=74.125.229.2
Received: from mail-dy2-f2.google.com (mail-dy2-f2.google.com [74.125.229.2])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60830606A333
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 01:12:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60830606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MK3QUops
Received: by mail-dy2-f2.google.com with SMTP id 5a478bee46e88-327b1d5824fso5048883eec.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 17:12:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795655552; x=1796260352; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c7j3FwDOAI6nNbfO+ghW/xE23uGn+Fjwx2xqRw4fD6k=;
        b=MK3QUopsaaw6CcNV6fOtRW68+gQVBX78U/spdYzSoF0aQrffCDrjeSSKbBtIpNHmlH
         rM+ioH8/FugzkwxZeuBQQ9xetS0XqKY1zNaOBi3f97vvJLQAIP+Rp3Aye/r0N/YIdeQ8
         ksnEQ7cLMaHnDQKcG8IsaYlLRJ/Hr6FCtOcjQTCumfrmSHEOTWk3pidV+BYHpMBITefP
         PNkuafPAr2uhVPNwe/gPfyStEo1OGA7h6KPpEJD8Lu64AZOLnsg/gPG0So5yA+INcRdd
         H+dXaOubw/dNOdkSVtQcPfVbMi1pP853ddL8GHu0KdZPbrxFt4dkSZzZWAP5NgxkwOTO
         6RTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795655552; x=1796260352;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=c7j3FwDOAI6nNbfO+ghW/xE23uGn+Fjwx2xqRw4fD6k=;
        b=Yesfua+XPuEJuREAhpZ+ZZa9trA/MEYX7BYg23ZCm5VpDBqzX7tEzzSgtjLHYoHigq
         wkewivDE0UkH+wiPYVWRk9G4ac0KSGl92zmA3zzWXdOGanolbRSYl4OGEjqhYFKsx1yQ
         PvbzX2LTmkYyrLu7Xk1o50d8RN8W1N2gzXW4KfieMM6soE6ft0P8tpvgiNrGrdVVVo0r
         kia65CcDPYEQK9A4WVuZ2AvWz5g+y7+KMLxSwFMvfk/XSt07OSYonX3OUho8vsWgaiV/
         ws/R+Cp3UWKy796Bnk+QN2H/vJqAnkDLsQuYlrGdB0eK8GJjEucwpvjUN1AM7VR6Sbek
         pqnw==
X-Forwarded-Encrypted: i=1; AL+hErHTaRBYHoCYG2RmmXP+6IhRq4ugFLDC6z4u81Cz1su0juFEhSU6NFpmqImH0qaqeJOD5rXfS7SVxjY4OoI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9f8YPI6MN95Z8LUIRQX+wSux6eWjkH3wyW6Hdz6E2T1Nz2S2dv
	m3enUT1P9WZ3ZAnE1Llsmk7KqpzOrXqN99WpeL06QJhggdc5P8Wu4L5l
X-Gm-Gg: AZFdTZfmO6JZr5QG4GxK4/4cOiCcZel23SPR2DYqIE9lFlF351BIjC+vWKFfDlXBPCF
	6lPnkFEpmFZFQyJgMmwNpomuG1d6weQxoHuGwJ7rztR3uEQYeGKPsGy5t8mYxmVewlsKNZzmn4L
	3gioaoziqwbW6Ek+Qw47BB9EVvBxP4r+hY4TcNnScXsLrmZqOtI2ZrTsU+Q74OKZx6Q0wiWN0AT
	QXgKtjfqg9AEz/kQMV7xqhCUVbX3FgXTbpjFusFFaaHmAHegWbeIBWc8JuZPSiHKbu2Y7jnJ+lS
	hclclRZq10iAxXdXpF5I0+GyOytkWzTtX7nvZvj8oVchSERPbgsyv2RjZV9hBQpdBhS1k7ZLX3b
	5jqgFIcLyl+bJ6IhGNjE8tqDyE3kxUuVQo1oFy3G+Bt1LGSMltSonc00RVRf8ALnmaVQ3paRe+c
	vpaI7RXMAz2OAFGZQnBXCE7FTxxPVQhkl6pjIrKb8iEod8QEzBhC7BlkDAhZ/b7uKnU4XCpf/bM
	abC1G5RTnhQP5nAeqPd3yWx+LzN4icPzbcyqodkxfwuIwAXTnc5CBPgD9UfcglHneuMYKtuzNwj
	PCdmq+pBAjVJObVXuFBw4hwAKhPn0I0ECn3F4NB4f8G3ESHy++dPdcc6fJjT5gdtUz5MyjeVT76
	Uqp/ryflqTbDy96WUmIKbJHWXMD6aiU2ngXZzu2Sd
X-Received: by 2002:a05:7300:26a2:b0:386:b0ea:3263 with SMTP id 5a478bee46e88-386b0ea340cmr10834543eec.40.1795655552534;
        Wed, 25 Nov 2026 17:12:32 -0800 (PST)
Received: from localhost.localdomain ([76.33.234.50])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385672c6f31sm55717751eec.15.2026.11.25.17.12.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 17:12:32 -0800 (PST)
From: Hungyu Lin <dennylin0707@gmail.com>
To: andrii@kernel.org,
	bpf@vger.kernel.org
Cc: ast@kernel.org,
	daniel@iogearbox.net,
	eddyz87@gmail.com,
	memxor@gmail.com,
	martin.lau@linux.dev,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	emil@etsalapatis.com,
	ihor.solodrai@linux.dev,
	alan.maguire@oracle.com,
	shuah@kernel.org,
	alexis.lothore@bootlin.com,
	luisflavieira@gmail.com,
	ameryhung@gmail.com,
	david.laight.linux@gmail.com,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dennylin0707@gmail.com
Subject: [PATCH bpf-next v4 1/3] libbpf: Fix sign extension of unaligned enums in btf_dump_get_enum_value()
Date: Thu, 26 Nov 2026 01:12:20 +0000
Message-ID: <20261126011222.92180-2-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261126011222.92180-1-dennylin0707@gmail.com>
References: <20261126011222.92180-1-dennylin0707@gmail.com>
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

btf_dump_get_enum_value() reads unaligned enum values through
btf_dump_get_bitfield_value() with a zero bit size. That makes
right_shift_bits 64 in

	*value = (num << left_shift_bits) >> right_shift_bits;

which is undefined behavior for a __u64 on both endians. The path also
bypasses the signed loads used for aligned data, so a negative value of
a signed enum can lose its enumerator name when the data is unaligned.

Fix this by copying unaligned enum data into an aligned buffer, as
btf_dump_int_data() does, and reading it with the same loads as aligned
data.

Fixes: 920d16af9b42 ("libbpf: BTF dumper support for typed data")
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 tools/lib/bpf/btf_dump.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/tools/lib/bpf/btf_dump.c b/tools/lib/bpf/btf_dump.c
index 08a4bbbf4ffd..85a30b373788 100644
--- a/tools/lib/bpf/btf_dump.c
+++ b/tools/lib/bpf/btf_dump.c
@@ -2329,16 +2329,11 @@ static int btf_dump_get_enum_value(struct btf_dump *d,
 				   __s64 *value)
 {
 	bool is_signed = btf_kflag(t);
+	char buf[8] __attribute__((aligned(8)));
 
-	if (!ptr_is_aligned(d->btf, id, data)) {
-		__u64 val;
-		int err;
-
-		err = btf_dump_get_bitfield_value(d, t, data, 0, 0, &val);
-		if (err)
-			return err;
-		*value = (__s64)val;
-		return 0;
+	if (!ptr_is_aligned(d->btf, id, data) && t->size <= sizeof(buf)) {
+		memcpy(buf, data, t->size);
+		data = buf;
 	}
 
 	switch (t->size) {
-- 
2.43.0

