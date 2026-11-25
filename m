Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795589680;
	b=EUaj49PeYhmVyG3KAjXoQ2QiNmqj4o0xEU2DH+G3MbdTrW8ddtlgJR8OkrVWOvnCfYzI
	 LLudEs5RLnFzOFzfamrE/X+7i3E+aFY4rf5pbQXJpzD6pglyAGvxeRP3h2PDj+Us6JiDT
	 XYxXj0jl801GUrzPaF2C9GBpkhiPlawv3868UlVuajRZq7zhxwI6rmRa+LCk57N/FQBSR
	 Z1dz/JFw7Ctg16kN3gD2OuJ0grhrxZAvKL7zC9Oj+hsEwK6aByPsr/xLcq/15Zt7RXjaV
	 xjzbTGwHc5Wq5km5SjidZB4AyRTEacfoDAoFZwBPPFtEhbE4F5YptMHGiYULvx+c1Eg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795589680;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=6WKlTv2ikV+tMBOUuWFLT86t7HrmSdz2dy/v4nMSeg4=;
	b=WV/ZyWlVq6LSwZJ8oRJPRnuH3fVXZk/M6wjTtqV3TBhwnbJK2saG5h01M5gd8POAZbV0
	 CRe6eW5jyfMrAWQaRtam/t+a3IPSEqrUsmqglj2xh48tYG+XWp/s7/ZMJyVG4GmjxW8+J
	 w75ZWaXH/hy2+UeIdyhcWQnZl7XhbCEqhRlxW2dhDmtUwzArtC9zU//TTrNtH6rEOWnfI
	 DmzOXBP2TAsYFio+3dFKL+1sw3IO/sCKMoziuRXqVttxMb7rIebClAd+5Bw3YMRBdNm1v
	 d8b0HxdEnCA14EtEQeRzrzH193SOFUsG/AF9Rmzlx9hiAW5YKA0Fiq7Zw7oL6P2rDOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudlinux.com;
	spf=pass smtp.mailfrom=cloudlinux.com;
	dkim=pass header.d=cloudlinux.com header.i=@cloudlinux.com header.a=rsa-sha256 header.s=google header.b=LtslzANr;
	arc=none smtp.remote-ip=209.85.215.172
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8FF3606A329
	for <linux-kernel@vger.kernel.org>; Wed, 25 Nov 2026 06:54:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8FF3606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cloudlinux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudlinux.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudlinux.com header.i=@cloudlinux.com header.a=rsa-sha256 header.s=google header.b=LtslzANr
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cde1479f76fso3061247a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 22:54:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudlinux.com; s=google; t=1795589679; x=1796194479; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6WKlTv2ikV+tMBOUuWFLT86t7HrmSdz2dy/v4nMSeg4=;
        b=LtslzANrqDUVC6r2xqMAWZBJ7DJK4fPKRmJG+V4ApFtevl+agm1IC2jxj6tLW702N6
         hZl+5tjJ6AdLSCmorONIJXAzep5CrzQrJDZjvJFD8sX20v7/eqKQuUhDMXLL9fdIcmjT
         gxbMTOe8m92fmSru8vTiDYw+RMACfurJ1fxHqbSB1DnkKnk11srDCMGpbnDh3FKXVhcs
         eZhPwhzf9J+Je9wlyYskzdaKnGxd2vmvcdURSjcmfRPgCaW3KqTAaJAphetV2Z44ilhj
         +qx/x+ITeojXo6sA8JinDHUoVeifTKLvv2ukJ3BU5w4bND2/D+gNrTRxgBP1c9RnqREt
         E4qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795589679; x=1796194479;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6WKlTv2ikV+tMBOUuWFLT86t7HrmSdz2dy/v4nMSeg4=;
        b=kip1K+eS8ebbl2MU+egxDaKLBNbh6BjKNQTH9BXMOOgqDykSWuGyxVwAiMWdrpDjQp
         2xFN6rGN65uLwge5l6BYY70/eqEwddQbbGvK2ARCLYQNGLgPI0YhGTIx4//GqKDrTH4l
         e9RhiBvLLYEbFpcGQpvl8kNRBbFZUYr9uILDiHNAV6jHCstqClQ10mhJgDQcE38TB/p1
         zbS8AXs9KhMGmipImvxbmHKAiOOqi/EXG4A/umNSOcXmQDsjrortP6L3mxUkQcQnj08U
         rEx4f7fylkWFGhaH2g/OnePbm15ptXCgtd5HlpeGa/6oPuhJAmKahlobXMhUtyDygZFT
         re/Q==
X-Forwarded-Encrypted: i=1; AL+hErEmOjzSfXgryKVBj3u422KqZWGcunCCoiclRgeLhW9U3bAy4g4e77jRU5tCh3QXZfiTb0r2mbbiWHUPSeo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9gkYqK2dlHF55Qu/tHUsP56y0OIjN4+Q+RU+TJzrnnQUc4VP4r
	BupTZe+9XgvHJUwn2JVPZp2s3pVybznjkehbNAPZA0EfpkEkoQH//368d3jZrPY9dw4hQZ9OzGc
	dLX966IQ=
X-Gm-Gg: AZFdTZej8xgjWp/tvgOjWEmzMpkpJiJlljknW5FOlS/SryzfBHmixV7BgDz6ad/wGxS
	uKwFOmoKVRUarXePIga07dRd7Y6LcqfWfZJ2BgU3WM0AHmI/ifHOvwbRno/yVVwwPcjvSgfi9ce
	ym0kI260KhxliulDXB0koVi49Q8ePnFicMzL8CNfv4EXuGrRu9GTUBIdyVzY6eNuhBlwR199yAE
	KazQt8oJjHCdYLfBiYL1ldIi5iOvCm3Syou5+16WhjAqv1ARMcpjQmk0mSajXJBN0GrBSClnrLn
	Rk46lHvqSk2aYfo8awKLeIRYPt37nqcxG5SPyuyYrFrpFjOxNEb7Mu1Vb7qe8x5t2VNd9c8dB34
	WFRU88ZGH8c8Csi0DSeI3iGJsrmS2ydd8Wk2yYtlQ7sPXhWd9pfvgkkn4OqGrU02Bm287T2bMZw
	a1+chyoah3alnCzLi7nvOZJgoci0l/4i9N5/4Nq/LCVszBFmnPxfHXMoMKeVJXEMKaTOhhv3Bi5
	r8amLR6laDpJdy5rwecihj18rbHGFqOau5w+5wscwrH33xUdAx+GevFn6XV+zo+RTIEbaI4u6/p
	ZBRBj8g0m+si5blFSUC21+EtV3GDXJzFfkL3
X-Received: by 2002:a17:90b:2c87:b0:3ab:f2a9:cacd with SMTP id 98e67ed59e1d1-3b41c94df73mr16354240a91.49.1795589678991;
        Tue, 24 Nov 2026 22:54:38 -0800 (PST)
Received: from rmustafin-laptop ([27.79.41.63])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad46ef5sm26149320a91.8.2026.11.24.22.54.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 22:54:38 -0800 (PST)
From: Rustam Mustafin <rmustafin@cloudlinux.com>
To: Peter Huewe <peterhuewe@gmx.de>,
	Jarkko Sakkinen <jarkko@kernel.org>
Cc: Jason Gunthorpe <jgg@ziepe.ca>,
	Shuah Khan <shuah@kernel.org>,
	Jaewon Yang <yong010301@gmail.com>,
	linux-integrity@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Rustam Mustafin <rmustafin@cloudlinux.com>
Subject: [PATCH v3 2/2] selftests: tpm2: test that io_uring reads are rejected
Date: Wed, 25 Nov 2026 13:54:29 +0700
Message-ID: <20261125065429.1483868-2-rmustafin@cloudlinux.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20261125065429.1483868-1-rmustafin@cloudlinux.com>
References: <awXHzblUfp05jZSQ@kernel.org>
 <20261125065429.1483868-1-rmustafin@cloudlinux.com>
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

Test that IORING_OP_READ on /dev/tpm0 and /dev/tpmrm0 fails with -EIO and
that the following read() returns the whole response. The test needs
liburing-ffi (liburing 2.4+) and is skipped without it.

Signed-off-by: Rustam Mustafin <rmustafin@cloudlinux.com>
---

 tools/testing/selftests/tpm2/Makefile      |  2 +-
 tools/testing/selftests/tpm2/test_uring.sh | 15 +++++
 tools/testing/selftests/tpm2/tpm2_tests.py | 72 ++++++++++++++++++++++
 3 files changed, 88 insertions(+), 1 deletion(-)
 create mode 100755 tools/testing/selftests/tpm2/test_uring.sh

diff --git a/tools/testing/selftests/tpm2/Makefile b/tools/testing/selftests/tpm2/Makefile
index a9bf9459fb25..44630fb980fa 100644
--- a/tools/testing/selftests/tpm2/Makefile
+++ b/tools/testing/selftests/tpm2/Makefile
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
 include ../lib.mk
 
-TEST_PROGS := test_smoke.sh test_space.sh test_async.sh
+TEST_PROGS := test_smoke.sh test_space.sh test_async.sh test_uring.sh
 TEST_PROGS_EXTENDED := tpm2.py tpm2_tests.py
diff --git a/tools/testing/selftests/tpm2/test_uring.sh b/tools/testing/selftests/tpm2/test_uring.sh
new file mode 100755
index 000000000000..516985ef20af
--- /dev/null
+++ b/tools/testing/selftests/tpm2/test_uring.sh
@@ -0,0 +1,15 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0-only
+
+# Kselftest framework requirement - SKIP code is 4.
+ksft_skip=4
+
+[ -e /dev/tpm0 ] || exit $ksft_skip
+[ -e /dev/tpmrm0 ] || exit $ksft_skip
+read tpm_version < /sys/class/tpm/tpm0/tpm_version_major
+[ "$tpm_version" = 2 ] || exit $ksft_skip
+
+python3 -c 'import sys, tpm2_tests
+sys.exit(not tpm2_tests.uring_available())' || exit $ksft_skip
+
+python3 -m unittest -v tpm2_tests.UringTest 2>&1
diff --git a/tools/testing/selftests/tpm2/tpm2_tests.py b/tools/testing/selftests/tpm2/tpm2_tests.py
index ffe98b5c8d22..6fe60e00ff06 100644
--- a/tools/testing/selftests/tpm2/tpm2_tests.py
+++ b/tools/testing/selftests/tpm2/tpm2_tests.py
@@ -9,6 +9,7 @@ from tpm2 import ProtocolError
 import unittest
 import logging
 import struct
+import errno
 
 class SmokeTest(unittest.TestCase):
     def setUp(self):
@@ -331,3 +332,74 @@ class AsyncTest(unittest.TestCase):
 
         self.assertEqual(rc, 22)
         async_client.close()
+
+def uring_available():
+    import ctypes.util
+
+    name = ctypes.util.find_library('uring-ffi')
+    if not name:
+        return False
+    lib = ctypes.CDLL(name)
+    ring = ctypes.create_string_buffer(1024)
+    if lib.io_uring_queue_init(1, ring, 0) < 0:
+        return False
+    lib.io_uring_queue_exit(ring)
+    return True
+
+def uring_read(fd, size):
+    import ctypes.util
+
+    lib = ctypes.CDLL(ctypes.util.find_library('uring-ffi'))
+    lib.io_uring_get_sqe.restype = ctypes.c_void_p
+    lib.io_uring_prep_read.argtypes = [ctypes.c_void_p, ctypes.c_int,
+                                       ctypes.c_void_p, ctypes.c_uint,
+                                       ctypes.c_uint64]
+    ring = ctypes.create_string_buffer(1024)
+    ret = lib.io_uring_queue_init(1, ring, 0)
+    if ret < 0:
+        raise OSError(-ret, 'io_uring_queue_init')
+    try:
+        buf = ctypes.create_string_buffer(size)
+        lib.io_uring_prep_read(lib.io_uring_get_sqe(ring), fd, buf, size, 0)
+        ret = lib.io_uring_submit(ring)
+        if ret < 0:
+            raise OSError(-ret, 'io_uring_submit')
+        cqe = ctypes.c_void_p()
+        ret = lib.io_uring_wait_cqe(ring, ctypes.byref(cqe))
+        if ret < 0:
+            raise OSError(-ret, 'io_uring_wait_cqe')
+        # cqe->res follows the 64-bit user_data
+        res = ctypes.c_int.from_address(cqe.value + 8).value
+    finally:
+        lib.io_uring_queue_exit(ring)
+
+    return res
+
+class UringTest(unittest.TestCase):
+    def read_response(self, flags):
+        client = tpm2.Client(flags)
+        fmt = '>HII III'
+        cmd = struct.pack(fmt,
+                          tpm2.TPM2_ST_NO_SESSIONS,
+                          struct.calcsize(fmt),
+                          tpm2.TPM2_CC_GET_CAPABILITY,
+                          tpm2.TPM2_CAP_TPM_PROPERTIES,
+                          tpm2.TPM2_PT_FIXED, 1)
+        try:
+            client.tpm.write(cmd)
+            res = uring_read(client.tpm.fileno(), 4096)
+            # The rejected read must leave the whole response in place
+            rsp = client.tpm.read(4096)
+        finally:
+            client.close()
+
+        self.assertEqual(res, -errno.EIO)
+        sz, rc = struct.unpack('>II', rsp[2:10])
+        self.assertEqual(sz, len(rsp))
+        self.assertEqual(rc, 0)
+
+    def test_read_tpm(self):
+        self.read_response(0)
+
+    def test_read_tpmrm(self):
+        self.read_response(tpm2.Client.FLAG_SPACE)
-- 
2.52.0

