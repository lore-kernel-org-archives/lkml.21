Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795591341;
	b=3CTMpwVJnQtnC7GxDzSkbM5Wp2RYmNA5UaDnxEWd9DD40K29RWI56S/BcId+NGzftshX
	 Jq+Voo2el+rqhIq6FiAPxS/pby8FUUnBuRdN4gxJ5USRLHPt53bzJ83FgKiR48r4KfC9h
	 BB3yeTmQxbkStKfURoxIi/+EDipxClmXiwxJX8feAIkGbdcBZdrqYPS4aEqtYQvNrbOvA
	 TbbmR7bd0BrNlnesLOF9gZ2GsjTsmxcj85WZ9BNCG/q10s/A0b8Uo9ioS6Vxo6ihd3w7/
	 La5C40DLpCA1i3a7bUfbu08Trl/9IENgqZu1nN7gdpkL4Dd+cqDSUbBOA1SzS7t9rQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795591341;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=zfcmyiq+nRVD4Gw8rxfHm8nS2Ueyfoxb3FhyxGvekek=;
	b=FL5q7yRg5yMJ1py3xXW5Coie6vOVufz0CsdMtS3Hj52PDlLNnS7BFt7+CvaHWWdkmbR1
	 D4Wtzved7rHOA0jRnuB1pCz0+OqDcSMVSRz4dH9PEF0qu9Aqta88qrXzjWmlkxwaS/n6c
	 1mOA/uYdRozIBEtiAe7TsrjWNIo+CXTGgfl5QYDm7BmaTgt/3kz3kh+MdSvAupdhVrwMa
	 h74Ydg51MXw2AI1OQbOT3o0t81f+npnUY+UoafYDeYUj4jm4pEz1VyFO4sW554usB8PQe
	 t+pkfC4oViocwGvjjAbzZjXaHr5vtKETjLCq8zd2XK6wu80B/DDdc4DXcNrb0vtzDkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b="gaJW/l6v";
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3BB6606A333
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 07:22:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3BB6606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=gaJW/l6v
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4a9be758734so3359588f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 23:22:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795591339; x=1796196139; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zfcmyiq+nRVD4Gw8rxfHm8nS2Ueyfoxb3FhyxGvekek=;
        b=gaJW/l6vSmRuBobAdkKGDwe7cEsHsWI47/VJzdmD/pJMKNw6R5O+m7PxgJQFU93K7E
         OVZQAn2JPTOIAbOqyZ1X6ISVStN2mm5ZdLf/8G+ldSovwqU94LoPdv1di36yOhfIIydD
         766NEZInyqIUXNTsilUjyakO6xM8NUaQR7LNCnzicCRvOTjnVbPp4T75k1uFrVsiFpx7
         wQJle5kMg1/OHtmrVnMLcyjgUIhOqhQLfRwSaEbfTnCKeusE4ZJbJk2ekgHWlBzhk3Py
         cjkJ1XNPMPCBriuQtGRXlhiF+RhYtAwo5V6GmUSb1BZHdEkqQtRANYOSILbj8+++xQDh
         Go/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795591339; x=1796196139;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zfcmyiq+nRVD4Gw8rxfHm8nS2Ueyfoxb3FhyxGvekek=;
        b=oilFDUI0252L6JEUcYWRE3hd125VfeNZhu1kZtD7CLzd8E8YfxEXcQu5pog1OMYqeR
         XdJDSTR/pSzSkDlNaxd1UC5EwpevKsC6h4oUgxyRg5wW9syk5zYyYxjZt4JEopQaM4CH
         aGwYZSNLlhhdLLkTekP1esOKlWnomK+iirS0GIcER8J+aI7YCWJMbt2Tc9p4fD98/c2G
         s/OLJRZUl+MvMCyvqnXDHcy/ifVeLNdWxSJxccEDRHIAi9ClyyhcmAg0v2sxpgtrYUuL
         uhztWzC/mZjUVs89rRiygpKFtnBOs38DH5glsYMV0W+1ldlCm+v0okcPuNXnY8ZRrR7b
         KluQ==
X-Forwarded-Encrypted: i=1; AL+hErEByM7Fhv5tvvy2XkyxKXNkayn+TVsnH6+G/u9NvOyYuO5mtSYOosk39eMwr7epfCYk4nuG5KQqIu4cHyI=@vger.kernel.org
X-Gm-Message-State: APuU4Z80PMRY5hffpp5my3kDeStnZEzfUdWKe3IqsvbGq8JyN+dmSXOa
	uehEpTtmr9Zf0CveCFY8jbBAguPZvuTMjf6F2z7xkcRY1yTy/wrGYISnZ91EMLhjT/k=
X-Gm-Gg: AZFdTZcEeRb3EWUyQTufQPD4Cy36ZaxNPMsR7OxhqtHf+9S1Rxemrcq6u/Ssy80z3k4
	wCDNZvkLB3GDvWLOhIhhEcjPSOLGDiQUJRqiAis1PGCFuolBtxRNAywGxdt/+M2ZS39rGjrz5ea
	bXSpgQN0yTgmNayhZmhDnFVIKF+mP0wxMS+JlyRNf44dxzHIU3bcYfdahWnNcUEaUKauYqO1e2Q
	3M5GsQmM0gemk33w8G870vMzK205CPFOH/sFC8mwJzu/xQcpjwcVO+2fuZt+WiqxeBn4NPsWo3z
	tGnidnaBEYfHpf+iQwYIfw68sU+4nWuZWMpaVmrgtTjpbtHgbCgNNBYoxzJd1EhPvz3jQAQSs4p
	Ux0dnnb3ncE4XI9q+PawgjksZzjixlhWVlOS01yNYk7yMcAE5yEKkl48Dmd1PL++94XZKQ2SXVQ
	NrLxLRYLphELOYZs33REx23AxsPgUUFZSD+aEbQ2LerQvS1nKEjCgKspo9aRNpMLQ0nDW6X3D7t
	rmYFVxtdEGsngR8taMEhWk2rC+L4fM1OB83ITXyOwuSM/vUJdUETsfuoRsivmd61PReIbPoaMij
	uMpmupBd5ClASguk+uo9RDv+Pfb4FT0Lpg==
X-Received: by 2002:a05:600c:1549:b0:4bb:6f45:2a77 with SMTP id 5b1f17b1804b1-4bb8880abf7mr327186815e9.11.1795591339161;
        Tue, 24 Nov 2026 23:22:19 -0800 (PST)
Received: from localhost ([2a02:8071:6e30:8500:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4bb884865a2sm509382235e9.3.2026.11.24.23.22.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 23:22:18 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>
Cc: Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Danilo Krummrich <dakr@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Aleksa Savic <savicaleksa83@gmail.com>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>,
	"Christian A. Ehrhardt" <lk@c--e.de>
Subject: [PATCH v1 5/9] HID: core: Make driver_data in hid_device_id a union
Date: Wed, 25 Nov 2026 08:21:37 +0100
Message-ID:  <15ea0b7b8bdbda0d19772b4d75a65131e1adf15e.1795589119.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1795589119.git.u.kleine-koenig@baylibre.com>
References: <cover.1795589119.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1000; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=QEFTzo2iU5KSQHdF8CX3tT8L9BSwZU/9ye4ZMlX548s=; b=owGbwMvMwMXY3/A7olbonx/jabUkhmy2ng5bn83r/94WCMo5cje93rHHpKNDi8UpPqYwf1fK1 fkGvis7GY1ZGBi5GGTFFFnsG9dkWlXJRXau/XcZZhArE8gUBi5OAZiI0wIOhhZHMZbi++rBLUJ9 rnHOB01cdodLPy3fa6nzPuBmUJcMb6DuupoLVQ/cBMy5VJLK1pU5vND9uejDaw7zx2t3985eLR4 QlCC5ZotDGuvm8jxZG/nXTU6hprGh9b1ObldV496arTS95KvmuOerm/au7825S5df2LOE9XZq4f 19igVWrP+2Zb/8Yrjac6dgyd3dl6sfLTayiLTOOGh/yyZxYYWw4ooUd65jNmGWNybZmr+z+TQhx e7IacUgQ0l5Jg+P8w39obJR7U+CSvcrVPrX3O+6pVDEtrf1YZuipXmq7iXmux/+ZSXduav9fJ1F 9s17vGujXZWX7/6wwHGl7eVdEzwlTMsWT6pJtVQ47wsA
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

With that anonymous union usage of struct hid_device_id is nearly
identical; only initialisation using a list initializer doesn't work
(and there are none of these in the tree).

The upside is that drivers storing a pointer in driver_data can do so
with more type-safety. So usually a missing const is catched by the
compiler. Also less explicit casting is needed.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 include/linux/device-id/hid.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/include/linux/device-id/hid.h b/include/linux/device-id/hid.h
index e865fc64bf94..e05a8974de4b 100644
--- a/include/linux/device-id/hid.h
+++ b/include/linux/device-id/hid.h
@@ -16,7 +16,10 @@ struct hid_device_id {
 	__u16 group;
 	__u32 vendor;
 	__u32 product;
-	kernel_ulong_t driver_data;
+	union {
+		kernel_ulong_t driver_data;
+		const void *driver_data_ptr;
+	};
 };
 
 #endif /* ifndef LINUX_DEVICE_ID_HID_H */
-- 
2.47.3

