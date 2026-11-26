Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795684048;
	b=kx9GeTsmYqewer37oVQIJ99QNYLALQhJqDsvPIDnzp22PfXgRbtGOh5gH/0g3VFyWTBv
	 VQPA84+8K0p65un2UuVERxi+zj3rDnhxSL9wif3VH6l1v8SvSr4Hkw29Jkli9cmhQRFom
	 HyDlEQPMFMRsYbAHA7i/42q61+L3aLNEK0pvgoX0TejsabfT3wbYN0Mu6rVr6yV1Npg7F
	 cT8KjitCvCUA6czTTCPcd6GDkfj93yMxE5aV5MM5uqEq7lUTQRxaZUf5ow+IpUswmH4UC
	 wATUbqcZi1EFmfTFLqM1pi6tbzdvOzp7gMT9LVqG2DX1iNag0pqm3XHkH3eocbDLWRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795684048;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=+TlTxiGjN2I2Df5Efr9+11VWHUXjBjD+ps0uEd++xWg=;
	b=PS0+SFsDrN2Na3WtoCK5TRQEXX7Y2rzRKIIX+R1YAUrkiyQLoedVQkWcmzqPnvn4KBmG
	 qfJ9ICjsZ2C/p+k7r+4sz23jFCe0xneJe4WkzvDKz6gMJC35glupGTPKDJGBUpTva09MO
	 fuJ6bIFra+70K4Bk1rrnDzSjoi7o6UiVJ7qlMj58QmY8YPKY/3877hJn2rXSCvVK30T85
	 fL4q4ipxX0OPg5KV99XCAHi1oV230P8FvxpjZYpBjbi9Kj+enJNXSVE+zIQjS6gDczSCI
	 ZF4fOpk0aFeHJkeMlOJjTW40KtTRndv3YJTXgPAfs7178pu6GRzdjKx/dSxNhykunQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sifive.com;
	spf=pass smtp.mailfrom=sifive.com;
	dkim=pass header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=UEQSAZcI;
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E207606A32A
	for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 09:07:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E207606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sifive.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sifive.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.a=rsa-sha256 header.s=google header.b=UEQSAZcI
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-38699cf08dfso8270168eec.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Nov 2026 01:07:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1795684047; x=1796288847; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+TlTxiGjN2I2Df5Efr9+11VWHUXjBjD+ps0uEd++xWg=;
        b=UEQSAZcIa546zCzCqTUO2ZUh1P+O+jja379HiVFOBPN9s2YBu9VpyQpTNfrO/vJoMS
         TtG3AMNxvJ5n+SWPpNfuCvGZ0IosWryyeughJ09e9pnAuTjOx8PMcBsgM9pYh/Z22I1J
         8tGw7WXiY3ZBLhK+eqaTPU/zU+eqw5m0i1ZBzlnd0amADx3yFApYdfyN2OY2otFLJ5PO
         E8t2qePffp+NZYXaY3TriefAJt+FEcMsUu4gBa4vnyWM1eirueLRmat8R0O59BMpII/x
         O1PH2WIuVKIzR2BYzKiDlswNq9wrQ4jgEYpZz1mX+3iZeYn0EIjqUqOF4KIEBOzGwAAB
         K5Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795684047; x=1796288847;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+TlTxiGjN2I2Df5Efr9+11VWHUXjBjD+ps0uEd++xWg=;
        b=wvKNvtn7a7m6H5fPYnzUW+5VRJ0K94ZWtpxSw6JkKLurUogSbMBwfXgrfsazEvKQVq
         1LZdgdM075P40QH4wKbRr/dA2q7fWNXq2Q+JEs/U+Fa1BoG89CG4oV0aJ1csR8RzFqQC
         XV3UKpevi6x/o6CIvBEuZK4QmBTEhzMnVu7F8yf/ahTm6a8vB/kdx4Pju0/XiiExpuf9
         FPwKED2F1f72HpOVOfR2Eli9ZBeXK6k99c753YJFbROrZhbUNs1noajJ1PIXsb6gJzZA
         tU3y+E9CiQrLRz876LGqvrP3wPCsB1kRRxIZlV4JWpz/p6mGTHoPl3G6Eis1nOeMrMCb
         0Ksw==
X-Forwarded-Encrypted: i=1; AL+hErH/spmNwIsTi6NkukUhi+qpl6No9WVNseGc0g+9a2VwvH8gXu+l5PxZwi3u7zXI+cohEPpIjTjxP4gV800=@vger.kernel.org
X-Gm-Message-State: APuU4Z+cTyRbxfo5O3tn/b1YigC6906uI2xcPaAXfnW39+P59aj37xoD
	eJOr3bhJyCkAsf8cz0NngVqGRvXGdAuuznp/Y8qssFzFdcLNraN5jjPDIiTt+EMSG8o=
X-Gm-Gg: AZFdTZd8jsi0vmykvrTcT555b2mhXT1/5UPYKm+qR1xk6H7EnQwsOg1AWiOXpJXg0xe
	vlGN3Yoep46uISCjHFeQbUMh29JsXl1DX4h4aXPW3kHYgmQbpZ6c3n4KoPI2qObfchNZX/gky6X
	mfZXq/uStHeaHwGvfZJiV9gj2g3u10YhO9K97XidceOhV9LyXgufNu7ISXkXX//SRybaMM6K6OH
	Br0lnwcMSYInMWEg3kk2Er4mJYGaUJz2zEyDAwOQO3tdc+Q4W+TP/ZTX5Jy4DJnNLk4TxoCoNwK
	zA3te1C1ZqHz8TvKdyTYGHx3S1F+MscThQRWvFPnzq+CGCEX58MXSstqQDTkkwYS+Lj+M1VUxx3
	11HhFq3lipjT7Sr+o2Q0rBnPq2+jwU4l3hneYK4qFzOmtqj+Uj8gn/xr40wZ7vQPDHVp42o7bPT
	Q+3upScl+IVImqoGdvaVVgiouRwoDLPku4vKUAMqY3sHRIQTsKnKu87wRCV0GCVMrqaEI9uR5O0
	Y+3FirKpWbHREntyAzjZS6TcluUCqopZ6gJSrpNgERl6NmLr9TlrzZgbH2GvVfK+aIjdQPlQJ8a
	nG7IRYvmHwFIzacDXdhMh474o5HW8DovozS56XreIpQqrjcb/LlikSvrLQjKsCUw4g==
X-Received: by 2002:a05:693c:37c8:b0:386:a0d1:1b41 with SMTP id 5a478bee46e88-386a0d136aemr22307891eec.34.1795684046741;
        Thu, 26 Nov 2026 01:07:26 -0800 (PST)
Received: from sw08.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7fc3sm54058730eec.8.2026.11.26.01.07.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 01:07:26 -0800 (PST)
From: Leo Yu-Chi Liang <leo.liang@sifive.com>
Date: Thu, 26 Nov 2026 01:07:11 -0800
Subject: [PATCH 05/10] gtrace: Terminate id_table iteration on
 GTRACE_COMPONENT_TYPE_NONE
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Post: <mailto:linux-kernel@vger.kernel.org>
List-Help: <mailto:linux-kernel+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kernel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261126-send-preratified-trace-v1-5-1e686fd75be7@sifive.com>
References: <20261126-send-preratified-trace-v1-0-1e686fd75be7@sifive.com>
In-Reply-To: <20261126-send-preratified-trace-v1-0-1e686fd75be7@sifive.com>
To: Mayuresh Chitale <mchitale@gmail.com>, Anup Patel <anup@brainfault.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Samuel Holland <samuel.holland@sifive.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Leo Yu-Chi Liang <leo.liang@sifive.com>, 
 linmin@eswincomputing.com, vincent.chen@sifive.com, 
 luyulin@eswincomputing.com, pritesh.patel@einfochips.com, 
 ganboing@gmail.com, dongxuyang@eswincomputing.com, 
 pinkesh.vaghela@einfochips.com, nick.hu@sifive.com, eric.lin@sifive.com, 
 huangyifeng@eswincomputing.com, darshan.prajapati@einfochips.com
X-Mailer: b4 0.16.0

gtrace_match_id() uses a non-zero id->version as the end-of-table
sentinel when walking a driver's id_table. This does not work for
pre-ratified components, whose version is 0, i.e.
rvtrace_component_mkversion(0, 0): an id_table holding only such an
entry is treated as empty, so the component never matches its driver.

Add GTRACE_COMPONENT_TYPE_NONE as the zero value of enum
gtrace_component_type and use it as the terminator instead. Existing
id_tables end with an empty entry, which maps to this value.

Signed-off-by: Leo Yu-Chi Liang <leo.liang@sifive.com>
---
 drivers/hwtracing/gtrace/gtrace-core.c | 2 +-
 include/linux/gtrace.h                 | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/hwtracing/gtrace/gtrace-core.c b/drivers/hwtracing/gtrace/gtrace-core.c
index 034987237abc..09b200bd1690 100644
--- a/drivers/hwtracing/gtrace/gtrace-core.c
+++ b/drivers/hwtracing/gtrace/gtrace-core.c
@@ -103,7 +103,7 @@ const struct gtrace_component_id *gtrace_match_id(struct gtrace_component *comp,
 {
 	const struct gtrace_component_id *id;
 
-	for (id = ids; id->version; id++) {
+	for (id = ids; id->type != GTRACE_COMPONENT_TYPE_NONE; id++) {
 		if (comp->id.type != id->type)
 			continue;
 
diff --git a/include/linux/gtrace.h b/include/linux/gtrace.h
index da8ba3779193..b8826b25d35a 100644
--- a/include/linux/gtrace.h
+++ b/include/linux/gtrace.h
@@ -19,6 +19,7 @@
  * uses the entries relevant to it.
  */
 enum gtrace_component_type {
+	GTRACE_COMPONENT_TYPE_NONE,
 	GTRACE_RVTRACE_ENCODER,
 	GTRACE_RVTRACE_FUNNEL,
 	GTRACE_RVTRACE_RAMSINK,

-- 
2.43.7

