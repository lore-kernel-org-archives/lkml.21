Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795874787;
	b=LfdQ+QPdFEfq4hQzzkRiOAjKTkGxp82ikSBGhNV/0IYuu5waZEI3bY8YcATmCJEcaw7Z
	 tQncZ9zTh/g0tf4kb25q+K+dM3MKdJqUaUEZaUPKfoX3ieUl/JD+iV1QmQGrTmEffKGrE
	 DF+5gIT2mbmJckGpwartyzahveVNQXTBqrIcTAIXJarN0SILcFqaFS8VlLNg7HvWNnDfF
	 WqIh/4oltgxdlnnCTGz5L6sJVk9We0qF7JXDfWAVW5H/TcK1a0n8SefjJVe2Mvps11WZT
	 a5TYgGKc76l34j7zN4lmw0li8wXDj52n+HSToLmypPdZOqRJ76BfzzT2m5KaxVKKZiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795874787;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=v3H54DsDzOYnj3Smze3+HlsIoq0mUB1s2ye+/e1WTeE=;
	b=qx1oPvxU49uZSrPRlAgfHT8Fxn1DxpZZcjqwdgYYKnB1Tav9xaa6jyq85RcP7Ef9ADIk
	 13zvEX0QT9JSq1BGNlhsbBd1XWMVhrxL5rLfJ1BRC3+SXvH9ZiHz9udmYDXw+kUS/L1hA
	 9xWAPzKKCByLTy6LVUkOW6AVm2/hF3Xamx95bqg8vsUjqKS2C1STpxD1ahqmsMXE0GpYx
	 4Va4bpF3UqKPIl25v6gYBJoPEe/xLX7ZpuH9g2nX4d2suqMdbEWNGqqubIhwEjl9Pfg8c
	 IAF+Tpi0K5K4i3oAH13Aoiusa//VyUYmP7ck1ihjjyqSpivHeWoJFZNT/HcakMyAaNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PJTWve60;
	arc=none smtp.remote-ip=209.85.160.182
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1640C606A31F
	for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 14:06:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1640C606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PJTWve60
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-5495d549924so94066621cf.1
        for <linux-kernel@vger.kernel.org>; Sat, 28 Nov 2026 06:06:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795874786; x=1796479586; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=v3H54DsDzOYnj3Smze3+HlsIoq0mUB1s2ye+/e1WTeE=;
        b=PJTWve60gkjqokB9j9i26wjB02mdIzdtXwOjB6PqhfailjyAe7ApzPFiNVxkuKL8LM
         Xd3DlUZqP/CRIWTjXjIfZOR9lxYbyZ9U28ikqqoEOk49AIGBunNOaIMGw8pJkdA3UyYY
         /Mc8fLGHxGWQ6Db0Kv50pqepr4FqsFasBji5+4LeFgqxJpyAtK7OXyLeWPrdmrq5a4Ht
         2Iip9v8mvDbuHMq4M12V6lZ1otYb6YnXBdxsejz/y3VXMLWYST01SEWJP0HWIcGJT8pv
         KSHKmWY4PcFLAFUxpgthYnynHIh6mah6LZ4eJbaqsiTmg4L+ZrN8q6HZF0JaUh0B8MhO
         FLEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795874786; x=1796479586;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v3H54DsDzOYnj3Smze3+HlsIoq0mUB1s2ye+/e1WTeE=;
        b=riWkZKDzaW231m4e3kWoGgCGlGq0Q//SfMEd2RWxijJaIrG5kLY8YqhaCXhqQcdkVj
         pQ0LfiwK0OB7MFy3g0s47NGWhLECrC0wb8Z4sLssr0lrJzIt4OydEmdIHs0ViVvvLrPs
         ohClMjyt+oqzR0sFeD1J36P4MtOSIYKAq+QLLGWdgtVzU2nqvudACcz9l9/1K0X09am/
         vqLoyE/kpEqy+F8RN+1jOrukm7k2Uj9KWJHyxqMzUT9ST/puNgRrqgvdtwSmtNYX7/wF
         KV+399Gb7EfneqU2TgmtB+i441VL2FF/2JfNVo3lG1++ibklUInqkqM5LHncHWI0/PZ3
         YJ1A==
X-Forwarded-Encrypted: i=1; AL+hErF5ZMcjlHHIj9XLVozXHQIFYNdwTRxTZY8bxx8dtFu7HZhhJQRYPKSW1GsLA89UdK5HqP1bVXtgsDrWMjM=@vger.kernel.org
X-Gm-Message-State: APuU4Z8UDlc8S++0D+LE83i0k2PN0Zh0IVJDUMpcENPH4/kJxA7OWcHw
	WOiq/D4DwLbozD7N6i9WGPMBwZbhumI36Yx/G6MTSr3P9xgYUHx81TojA08yr1oNN5NMXg==
X-Gm-Gg: AZFdTZf9b5dRmm5iD1Hf2qaCTfbVUESjn0UZhKsyjbHhDmNnD+qKzyfbsX77LFKlYFO
	O+GdiEpSmZqeRwlcGEo8Es9dxI8Lml69FGWqS6nGCAh4b4EuI1iK6BS4awrKtmjgOxtTOxfBxWv
	MghrjCdTmk81N2QnIQ4I15J4RbN3mBkMM2Cjqq7MfH73MqjNWCXIgKQwcrvrINlmUjJ3jOi9eo+
	5NH7Pb6TCxu/YDds64rEPUl7ZgBV4gyOcp1HLxmax/2cw2ALeGFdxeU+A+R9JK8ZGN7Y/94zuTQ
	y/QzlOz32AQcDJdaz9Sz5abS9I3y/6ULXJXrJpHad9K1CrEiY1Sjhg2eqs+rlXhomxEJyLDATHt
	bcBa+8BBTQOp6h0gUeMNRYj+11vU14k1aVQOE7OBGJ5PIQPaoMB2/THi5e2bFt/2eznEopTCFYr
	P+TUFIJaqvQnxCPBWwh/nutojsP/CNRag1jey7Y+vke7m6vcB6IRSku99/Anf4CW2FTGxADH4cf
	XR9hDlrqLvK7bisLjVc1Dv+eXXyd+p2ikufsLUOVXYHOM72J7oGfgkBqwGK+mIF3aMRyBcZIdlb
	SsXaUgJVm26db6SpOToiBevj7nsfciji4Vrze4wfZbJza3csqYNYkgZeuhTpEyiNQPmHe4Qb2wG
	5yeVj
X-Received: by 2002:a05:622a:98a:b0:534:dcbb:4920 with SMTP id d75a77b69052e-55d76a19c9emr540008471cf.42.1795874785928;
        Sat, 28 Nov 2026 06:06:25 -0800 (PST)
Received: from localhost ([138.197.109.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d788506b0sm230475611cf.17.2026.11.28.06.06.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 06:06:25 -0800 (PST)
From: Nikolai Dokutovich <ndokutovich@gmail.com>
To: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Jan Kara <jack@suse.cz>,
	Jeff Layton <jlayton@kernel.org>,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Nikolai Dokutovich <ndokutovich@gmail.com>
Subject: [PATCH 0/2] listns(): validate the reserved spare2 field
Date: Sat, 28 Nov 2026 17:06:21 +0300
Message-ID: <20261128140623.19-1-ndokutovich@gmail.com>
X-Mailer: git-send-email 2.43.0
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

copy_ns_id_req() rejects a non-zero @spare but not @spare2, although
struct ns_id_req documents both as reserved.  Validate @spare2 the same
way, and extend the error-case selftest to cover it instead of only
@spare.

Nikolai Dokutovich (2):
  nstree: reject a non-zero spare2 in the listns() request
  selftests/namespaces: check that listns() rejects a non-zero spare2

 kernel/nstree.c                                  |  2 +-
 tools/testing/selftests/namespaces/listns_test.c | 11 +++++++++++
 2 files changed, 12 insertions(+), 1 deletion(-)

-- 
2.43.0

