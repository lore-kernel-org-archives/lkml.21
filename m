Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795125000;
	b=UD78BkdjZeCBWHpvNNCu2F9wcEPIQ1VpLU5gwMjLjsPd2KMh8RNuKsByr2r2Gs4qsh2/
	 B+pAAWfJGZjwlMGVoXBdhilkQytYQechUknIyiHtm/z59snEXDwh7euwFtRYZHVl+42I2
	 9ANtQKSF1kzw7JB1UCf2aqkgkmnrZfF/9kDhC1YE5NheAvaSeWQu7htvLO88ul+sulMg9
	 gqJ+lvtvLnO8+9mLExswejWlQd1Rj8vWzd9+FPnJt3wDULu5D0ySLLSStqykErljfva8C
	 ryMMErSu2DUIos49KJbr7qo4DnbZovgpQzErCoIh8ocdRZbc5IdPMlK/GD+SGAWTrYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795125000;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=ztAGIxfsJeJeYbrxCepsv8LrburFVrWDTXV5CLSdeyQ=;
	b=VXCq+xik4xGbA7I0LBQ7E+E00nyF+o5qvkWGMOdeyN3vMLtjq4sKvOf2sKZDdKkjaunc
	 KD0Z9ads9GetVnHWR4fy+MFXLCzXPwmx/R1iDc2TOQlO7pOJgc0SUkLOBgE32QfTlURqA
	 woJkNNbKAo3gG0aDxE9YgZzmmmRIKtj1zEtaisxRFA1Be5mJVyX81Uexe4cYQNBebCBsg
	 Y3skiweJ/uXWT2Kar5L3XRol9F7V94zL1ZJJxQZeo+9hYeZxYFLhVgeUuFt/y2yDaPBWr
	 +O2qwdJOXn2cwGHFfaO7JGpCumwdv8+X1cX1PExVJZQLzmDWw79fCtpFy0L9oD2uRaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--sarthakkukreti.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=SmKPdUhi;
	arc=none smtp.remote-ip=74.125.82.71
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC74A606A32A
	for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 21:49:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC74A606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--sarthakkukreti.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=SmKPdUhi
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1b29df78132so276047c88.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Nov 2026 13:49:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795124999; x=1795729799; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ztAGIxfsJeJeYbrxCepsv8LrburFVrWDTXV5CLSdeyQ=;
        b=SmKPdUhiKG9uwoTev3LkNgOF9UWy4G/Tu/UBqJ0fJr8zuNbxgX8cfLAv7suZKdV/zX
         M4KutBajFKCdgWeBcaV+6+MwvMsJv69o7tANOpqHhrrKOBJUZfNXniKxqMI80fre+A3L
         1UMW06mu3NZj7PdkCnI3A7zWQYtW128SbN7AS3CLYBjPGuJdIqeGHmj+XGkENPUh2LSF
         jug/oOZUE5crY7F0ADf47N0fXq7y5pudGteFFYKyAAtoiKBFFOE3ce4JteikPpdbBkjP
         TFm9D2VY4BrRZlx33jxSZRuIZvWo7osMHZUudaHwZWu4UouSmCWt6XpEvMfrXNx6gJhy
         lEqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795124999; x=1795729799;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ztAGIxfsJeJeYbrxCepsv8LrburFVrWDTXV5CLSdeyQ=;
        b=LxAL09Xj1qqDpixMlEWVGRXsWPPXeIjRog1asXbRfw9UNCFyGqgwjQq2D+eY0KbrDs
         jMQ9fU7OLPkqkMCICKXyHwsH1SLu7OOgPHirdFdc9Ua6kGSD8IHPUEvSDKa39ErA5dZy
         btV7ODoMufXxqpEAu76DEAkpsi915GVEk3jv83Qno0KFzPk3gFLPhe9HF7oLp8AW2MVK
         rZE8GOeM44OlV7HtrV0Gp3sdGCccmmq8fUJJCcl5Tn2e9sNWflk/+iHw4+cGaEr+zM8G
         9FaScENTxaPD7FMj1BYSsRZ5B6T2H5Lj097FLWF4XLcfG7h9VxhgDQHR2gjEislphu+l
         ovFA==
X-Forwarded-Encrypted: i=1; AL+hErF8rNTlA8f6cgllf7limFynLq1dfBgVLr62bpVgfJHVWFC2CHNaleBFW1o9Vk2JPXI7auqGbtZWthxXPDQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z8aVn+LYsgdZmSX9ZIN5F5R4QJxrh9uTgtuf3xabt2jOxv7KPjD
	3Op9B33IoYDx68sTyNGv8ctGkK/bcw7QSAi/83AT7iBajl9q79G/69kcCjucLjziicV2MO1bi1T
	QB3JLvqg31dBLAHYKm1F2HaUeR9Yv7N/UNn30YA==
X-Received: from dlam10.prod.google.com ([2002:a05:701b:208a:b0:1b5:55a9:d18a])
 (user=sarthakkukreti job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:701b:42d4:20b0:1b5:43d8:b82a with SMTP id a92af1059eb24-1b55689e7b7mr849071c88.9.1795124998470;
 Thu, 19 Nov 2026 13:49:58 -0800 (PST)
Date: Thu, 19 Nov 2026 13:49:44 -0800
In-Reply-To: <20261119214944.1480596-1-sarthakkukreti@google.com>
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261119214944.1480596-1-sarthakkukreti@google.com>
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
Message-ID: <20261119214944.1480596-4-sarthakkukreti@google.com>
Subject: [PATCH v2 3/3] f2fs: reject casefolded names that fold to ".", "..",
 or empty
From: Sarthak Kukreti <sarthakkukreti@google.com>
To: "Theodore Ts'o" <tytso@mit.edu>, Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>, 
	Al Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>
Cc: Gabriel Krisman Bertazi <krisman@suse.de>, Eric Biggers <ebiggers@kernel.org>, 
	Dmitry Torokhov <dtor@google.com>, linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org, 
	linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
	Sarthak Kukreti <sarthakkukreti@google.com>
Content-Type: text/plain; charset="UTF-8"

From: Dmitry Torokhov <dtor@google.com>

Filenames consisting only of ignorable Unicode characters fold to empty
strings, and names with leading dots and ignorable characters can fold
to "." or "..". Allowing such names in casefolded directories can corrupt
directory structure or cause confusion with special entries.

Reject any non-dot names that fold to empty, ".", or ".." during
casefolded name setup, while still allowing invalid UTF-8 sequences to
be handled as opaque byte sequences when strict mode is not enabled.

Fixes: 2c2eb7a300cd ("f2fs: Support case-insensitive file name lookups")
Signed-off-by: Dmitry Torokhov <dtor@google.com>
Signed-off-by: Sarthak Kukreti <sarthakkukreti@google.com>
---
 fs/f2fs/dir.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c
index 97f7fef6b068..f1d40f818b35 100644
--- a/fs/f2fs/dir.c
+++ b/fs/f2fs/dir.c
@@ -77,13 +77,17 @@ int f2fs_init_casefolded_name(const struct inode *dir,
 
 		len = utf8_casefold(sb->s_encoding, fname->usr_fname,
 				    buf, F2FS_NAME_LEN);
-		if (len <= 0) {
+		if (len < 0) {
 			kmem_cache_free(f2fs_cf_name_slab, buf);
 			if (sb_has_strict_encoding(sb))
 				return -EINVAL;
 			/* fall back to treating name as opaque byte sequence */
 			return 0;
 		}
+		if (len == 0 || name_is_dot_dotdot(buf, len)) {
+			kmem_cache_free(f2fs_cf_name_slab, buf);
+			return -EINVAL;
+		}
 		fname->cf_name.name = buf;
 		fname->cf_name.len = len;
 	}
-- 
2.56.1.750.gf70dc682cf-goog

