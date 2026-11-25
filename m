Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795596056;
	b=jSvA4XtWILdncq7qfDmTtHyaAtGuUUEdXl6cuqB1P3eNjpilMpY46hUVcP9YJQr+GVAM
	 Ab3YV2owaKj1B9S7LdMzub8gpdEyIvk7fYGXKn5qV+amVzTYAqtMyFBTi8bPg79kKAOo4
	 cRjSRC95oDaMNdToBQG8XPtWFOhnzNCgTqwQcp7ywr0ckI9PLTmuRKk2KaQBNWm6RIUqP
	 jCjH++Mot5mnmRuVigRJg+dFZTBLQQ0t1VkfsC61KM/45kiAA73+A02ggQusR4oM70q28
	 orYnmv1BhgKdyA5eXe7/yRGs0+DkQ7VldFr8kFq2qiDj1n0pkWp5zcj7Fmr1fDBbbTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795596056;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:Sender:Reply-to:
	 To:Subject:Cc:In-Reply-To:References:MIME-Version:Message-ID:Robot-ID:
	 Robot-Unsubscribe:Precedence:Content-Type:Content-Transfer-Encoding;
	bh=xLFiIgk2yoyirJp5CHV7KlDPYjkzm1bwOmOyIhKejAE=;
	b=C+IwbcOdiej2Aqfi/q8AG68Dgy+dE8o+ak3gTqZyFbZkxSAv3EUDMBfOw9osawvuY7rx
	 yAXMmjS7zrVR3OIzeA4JqioDl6OjM86dVx9LtUxjgaHGKcwOLX0mFT2LT6cQnggLR9Huh
	 xdUU7D/94v+3M9ff861INMKLlaaLEXznAl5zT0BOlRfA490igBwSXMIpmqi44oChDbh6/
	 ff5y+2SjFnGktxcS0iVXFmtbBIzGkfSH4UWGkpj0vIlyeMOl710TPaC8KfQXHbAl7cda6
	 m1Vqd76WxznQZcQnWGT0VbVho33vqsGgga7WjIfTI/kKtRuNnNfPZPJr1IcxyX8MsiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=lwgl1xG5;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=Q7cjSEoG;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6787F606A6B9;
	Wed, 25 Nov 2026 08:40:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6787F606A6B9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=lwgl1xG5;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=Q7cjSEoG
Date: Wed, 25 Nov 2026 08:40:51 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795596053;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xLFiIgk2yoyirJp5CHV7KlDPYjkzm1bwOmOyIhKejAE=;
	b=lwgl1xG5ap4JmWiwdCG98/7+K6dGeAAUMmYtvKcD7tPoNn//BWV5jQ/jaXtYWdSo+NKdLq
	h+hf46iU+TlB2KocqIFpjFSctq0lR2TiNxq5hJqlpqqxMbzA5PTLayjsNBeLIH1o7qk3EY
	X9VXa5vk9RN1kVngmaAWOY6y5UhMuaMZmhZEEgKIZRSh1xx16R6l0avnGc3/JzDsfCqofH
	NqnHPG0mCnCyr76abweuH4GWBHq0D/4LH3ML9vkZnc8a5Uat6wgsDJKwBHpImq8Rs0Ya/H
	2eEjOCgWabW7pGKzovcDkMoAGFbkKqZSICy6NYCA8+9/JoQKf9dPyBTFUXZM2w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795596053;
	h=from:from:sender:sender:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xLFiIgk2yoyirJp5CHV7KlDPYjkzm1bwOmOyIhKejAE=;
	b=Q7cjSEoGz/mDnukfvyxZXF1MfyHka03jzEXq3Evt84cE/zD82wPdGBtiPa8io6YSG7KtiO
	slbRRKJ9uNkWWJDw==
From: "tip-bot2 for Leizhen Zhang" <tip-bot2@linutronix.de>
Sender: tip-bot2@linutronix.de
Reply-to: linux-kernel@vger.kernel.org
To: linux-tip-commits@vger.kernel.org
Subject: [tip: objtool/core] objtool: Fix misaligned load of the alternative
 feature word
Cc: Leizhen Zhang <lzsx618@gmail.com>, Josh Poimboeuf <jpoimboe@kernel.org>,
 x86@kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261110000255.1720945-4-lzsx618@gmail.com>
References: <20261110000255.1720945-4-lzsx618@gmail.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Message-ID: <179559605190.92412.8685576222583221806.tip-bot2@tip-bot2>
Robot-ID: <tip-bot2@linutronix.de>
Robot-Unsubscribe:
 Contact <mailto:tglx@kernel.org> to get blacklisted from these emails
Precedence: bulk
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

The following commit has been merged into the objtool/core branch of tip:

Commit-ID:     dbbf7c1842625d675ba4ab10e33fbe1e6a72b816
Gitweb:        https://git.kernel.org/tip/dbbf7c1842625d675ba4ab10e33fbe1e6a7=
2b816
Author:        Leizhen Zhang <lzsx618@gmail.com>
AuthorDate:    Mon, 09 Nov 2026 18:02:55 -06:00
Committer:     Josh Poimboeuf <jpoimboe@kernel.org>
CommitterDate: Sat, 21 Nov 2026 23:24:39 -08:00

objtool: Fix misaligned load of the alternative feature word

get_alt_entry() reads the feature word of a group alternative through
an 'unsigned int *' at offset + entry->feature.  On x86 struct alt_instr
is packed and 14 bytes long (ALT_ENTRY_SIZE) with the feature word at
offset 8, so for every odd-numbered .altinstructions entry the load is
only 2-byte aligned.  That is undefined behaviour in C, and UBSan
reports it on an x86_64 defconfig build of v7.4-rc2:

  special.c:84:18: runtime error: load of misaligned address 0x52e000018416 f=
or type 'unsigned int', which requires 4 byte alignment

x86 hosts tolerate the access, but objtool may run on hosts that do
not, and the compiler is allowed to assume the alignment.  Copy the
value out with memcpy() instead.  Running objtool with and without
this patch on the same defconfig vmlinux.o gives byte-identical output.

The report was found with UBSan, and the analysis and fix were
prepared with the help of an AI coding assistant; I reviewed and
tested the result.

Fixes: be5ee60ac554 ("objtool: Provide access to feature and flags of group a=
lternatives")
Signed-off-by: Leizhen Zhang <lzsx618@gmail.com>
Link: https://patch.msgid.link/20261110000255.1720945-4-lzsx618@gmail.com
Signed-off-by: Josh Poimboeuf <jpoimboe@kernel.org>
---
 tools/objtool/special.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/objtool/special.c b/tools/objtool/special.c
index 2a533af..5df169d 100644
--- a/tools/objtool/special.c
+++ b/tools/objtool/special.c
@@ -81,8 +81,8 @@ static int get_alt_entry(struct elf *elf, const struct spec=
ial_entry *entry,
 						   entry->orig_len);
 		alt->new_len =3D *(unsigned char *)(sec->data->d_buf + offset +
 						  entry->new_len);
-		alt->feature =3D *(unsigned int *)(sec->data->d_buf + offset +
-						 entry->feature);
+		memcpy(&alt->feature, sec->data->d_buf + offset + entry->feature,
+		       sizeof(alt->feature));
 	}
=20
 	orig_reloc =3D find_reloc_by_dest(elf, sec, offset + entry->orig);
