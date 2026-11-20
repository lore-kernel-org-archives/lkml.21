Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795182100;
	b=HdDCaW0nFooKPqNyX8dkHYCLdRf9khJfysm09Fpc8hf/sNRuw3uxuCm5udJAyb3be18V
	 3tdLr+UIa3UsL2AZhD5got3RO6U1p9D4BiBQnRSnRwdaYJEFw9olqpFZ8U0kqmLJZFwCS
	 M+8K05pNL0/yY2Z5tDB++1tPUkOk5TPpOMQMsxtMv8NdDVYAskV8tcIl9mtHJjWOpD8r9
	 UHM8j6uASb2X32Zmpol9IskzAC8Woy0dN+ySlrI9CoxPVHPfOYXR5B166RVArQsJ/lQZC
	 YtTxtvHYLPsG3y+Z+VsSBaaVCt3NNj23/SVE5tKQ+l/ZGqYUL/lhXEsfifR3xMBQNhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795182100;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=1WRSk1fMXYd5O0O6jt0KQHSp9k/CAUXLKK0HBCgDuMc=;
	b=l43bwpt/07mo0FtGmkrN02EKT2PJQ8WVCmKE5CPJ+dQqmodaZY5pQi1zdFAbwLiO8GgE
	 JxAv/H/vMjc05Iibvlswmc7YOSSC6N4qcreTBEQMTAgWjdELZKC4KkF21QhlxAwFWWjfU
	 htFB92YGypU2kMC3ltfkjRHas6auwVn86gS1Hut6Sn81Xw0FHByIjX9OR+x6d2Pv3bZ2N
	 ijXjeavQeB1CdclOtghQfCYyHFsuuWQFpZ94NQqQpZSqZ6/YpH4se/KcSRYQC8gJTIueo
	 QKryxCm/llcTztr4VZLzA8NozJrpV8y+WLO2/nwON2/8C3KSFS+2HQqHRa5t7zP7m1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d7tAhQf7;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53D4F60A260C
	for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 13:41:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53D4F60A260C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d7tAhQf7
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-49a92144733so448792f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 20 Nov 2026 05:41:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795182099; x=1795786899; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1WRSk1fMXYd5O0O6jt0KQHSp9k/CAUXLKK0HBCgDuMc=;
        b=d7tAhQf7QMlnUJOdtTPvwLiq66HI7OQ0A8PNsxbBu/euzqha75rPVRIvSvWUdGu580
         UoqNwhsUZuOrej98Xd/mCrM7iJ8KzmUOQD2/VFLzMnBKgnfxpzlQx2hgmLqEt/bZMRpV
         SeolZxTCgycYP69WDsrnvMYk5ixy6V86BGWylprizMvlT+rr4z058VaVl73VWJcQiYBG
         sTqahv0aB49BwskZ9HkIewAQz+9BabPDqsHZY87L3xNURHm1MEJGHzYH7SYzS4uNA1Lt
         iltdA1a9t9Lp94x/qGfUoYxPAYxd2Tc7N74T5QWuF6uOiYmIGlGVN2OxBGvr/BV2k+lx
         2qeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795182099; x=1795786899;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1WRSk1fMXYd5O0O6jt0KQHSp9k/CAUXLKK0HBCgDuMc=;
        b=L2QO4TKsr13VZiln6zUNv8bWWKxCiZDL+WXk1VGdJ41Ye0Dits6iEJVWy2aB491nId
         It82V7Ocs5dhBaxl5LT+61bZuFpjIWkD+PRziY7WZ4TEejDZfeelINqOemXSDNMqOSAO
         POgDlNkM8TENdDUhp2ht+WXojXVZpNUpDwCMBZTtDB/Heo29smksg7u6sGsd6B5G+8bf
         6iKCcu5Kp98EPo9wL2IJ8aApodGLfJbUUCKJnJBLB3zFgxs9CBgx4T4I7557HpoDbelV
         GRs8B5iNLdoIxWp+VMk1nmN4xBu+2HXU/kzBodOui/KiQ/I6QuUVOPuykEghXYZxqM9o
         qfcw==
X-Forwarded-Encrypted: i=1; AL+hErEFup2U6Ra3MZhYbYvvLZuDDdJegfTrC4IySkjdV0gZZgP8uyFZuHRR5ECAyDNGBAGV02InQ05xmll3sQM=@vger.kernel.org
X-Gm-Message-State: APuU4Z/94fVewhAqnMjf4oL4ScfxvN13LZc5P7ejo0UrM8joRTO0vNRl
	P/TOcN/AXd74LY0gDJDNQ/DnOAgnEIegyKzhIYcGSFdRbJoizT5oB9M=
X-Gm-Gg: AYBFou0nqpMUm8vwQJuH5LySQ9274lxCmqdh79WjdmrbxEmFpwcLWBHgubEROHXoADE
	arkDTKdNt4+3GWk9Wf1Az723Cd0UIlXXWyPCmXPveFQ8KOkPEydnvU3deYpMWeE+HC3mRvI9cHO
	0y3X0STg9On5v064+k+fVFahSIDskU5jF/IcokN+q9Am+G9qlHnaAIU56NfUipGUluHfC9yTHDI
	g1NTCfNl3NaK58IyNO/lWiL9Nz1tttcrnZRKVEu6Nt9uwU91ued0tol291UjzXZLRlVAIsRFtKa
	Hp3067Ir/PhF9/fVtK0TRmQxr8tcMMV9nDl9dXWPH3TT7wLX8AAKqcZKF2vn9otyyijnOgPMrqa
	8SscoEdP6mq6eDgRCfBz5j9pWLRO4PaqZ5Bktt8u0Hb7ZgjUkwh3xLz1AkswXwgvzHRvCSK5bxl
	Hdh9b9LPv/hrK8gO3IV47HWCLPHMe1adxZin0Sz9g3I4DrO3S5vqgXmtJB0SUbqzX39h/tImqC9
	wVulfuZThQrJYqdzsXZdIgoqtc8BTRrT4TawZCeNNmUSMIu9egKAAaEMgk4K+eMYpB2o0+lOrFe
	ailCeXsUWsjGuhhNq4FmVEDwJLcEsMID28d0r01SwQfLtAecU8Q7apX84VNYzEIYt1HdiMPTCTn
	nBXcCRQehzIdjQBrZLlfGIeuoubMudipODDWgb23g0yspUid2gvuROcT2JADqcPdj53d/eUjWrm
	DBXJxyBV98JGljigTVBrhY4RrXll2rSKXz7vfjT1juttqhDoIse0LFHqbH/qWFyJmnaQOKb+3R7
	69C
X-Received: by 2002:a05:600c:3b8a:b0:4a3:59c9:a754 with SMTP id 5b1f17b1804b1-4bb8892da25mr69150435e9.22.1795182098659;
        Fri, 20 Nov 2026 05:41:38 -0800 (PST)
Received: from archtop.localdomain (92-242-248-67.broadband.mtnet.hr. [92.242.248.67])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b09bsm186430835e9.4.2026.11.20.05.41.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:41:38 -0800 (PST)
From: Jakov Novak <jakovnovak30@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Shuah Khan <shuah@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Cc: linux-kernel-mentees@lists.linux.dev,
	Shuah Khan <skhan@linuxfoundation.org>,
	Jakov Novak <jakovnovak30@gmail.com>
Subject: [PATCH] selftests/x86: sigframe_fpu_portability: fix TAP plan mismatches
Date: Fri, 20 Nov 2026 14:40:06 +0100
Message-ID: <20261120134006.4819-1-jakovnovak30@gmail.com>
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

 The plan set to 2 with ksft_set_plan(), but check_avx_support()
 may call ksft_exit_skip() which leads to a TAP plan mismatch.
 Move the ksft_set_plan() call after the check is done.

Signed-off-by: Jakov Novak <jakovnovak30@gmail.com>
---
 tools/testing/selftests/x86/sigframe_fpu_portability.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/x86/sigframe_fpu_portability.c b/tools/testing/selftests/x86/sigframe_fpu_portability.c
index 8377de052032..f738895e5159 100644
--- a/tools/testing/selftests/x86/sigframe_fpu_portability.c
+++ b/tools/testing/selftests/x86/sigframe_fpu_portability.c
@@ -221,12 +221,13 @@ static void test_invalid_shrunk_xstate_size(void)
 int main(void)
 {
 	ksft_print_header();
-	ksft_set_plan(2);
 
 	self_pid = getpid();
 
 	check_avx_support();
 
+	ksft_set_plan(2);
+
 	test_valid_shrunk_xstate_size();
 	test_invalid_shrunk_xstate_size();
 
-- 
2.56.1

