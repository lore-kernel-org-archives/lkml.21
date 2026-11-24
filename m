Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795530289;
	b=QttDtDP9MAczbxTwDM+HLwR6TMBHsssI/jE7NkyZGbhVuxIub5yaN9n6c52APRu/bJ8X
	 ZswexziG09eTDQZ16m/wcgcSqA00GXxZsRvXFcXNF+Orja9pb41l0s1tQz3UB8/Nv2t6o
	 fQSBZN2GnniqCGwmE+ZsV6WuUzI8uqtcdYklEqSXRMHVA0fe99P3j/wFZ8a2HfExK9Obd
	 3NOywO5gZyv0T6oFeqTNjOMmKewXh3C24ZCFID/l73oCZ1MfPFumaSfz4bZxCNogYCS7n
	 YTgsKZxgBiMTuK4abxkH0oiWEBDZyqegK6mUYtDFW5xAkVZItNtz8bUyFz6TFUGP7Ww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795530289;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=KXE7cnFOP3ln9NR3eVHLPVzp6B5Ml9Wh1PqMmVWUxaw=;
	b=ggMdp+IyXhENnSjbtGLyz0866X6gfsH6eXXWIIpK6cQN6BozVZlsBUa+/ayeSAQ7eaxo
	 GtuH7wOvEznlkDvRXkjZ6RBlZBK9iwsRHea6V1xApyNvKFqfY9GPW+/UpLbMTFJW8NQv8
	 FSBusXHNLlXmzbsYDhj9my2V9SutR3k6f72S5XyA3OIddrBjMGlwjaRqrKxIb8La7QQHb
	 2kEAffhcLNQgpiB/WDxT+Yy1HQ6JV4dFOSK8qQ20DLX/Y2tmU1koVPSsJSmWkMc0U454P
	 ujDNPXcQhLg471pvyWpsFk22I8h3lxxO6CnlAnIKlLYmHXNPmTLtAx+z5Zk5LuSnTEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudlinux.com;
	spf=pass smtp.mailfrom=cloudlinux.com;
	dkim=pass header.d=cloudlinux.com header.i=@cloudlinux.com header.a=rsa-sha256 header.s=google header.b=NsYXFd4w;
	arc=none smtp.remote-ip=209.85.128.178
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 726CC606A321
	for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 14:24:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 726CC606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cloudlinux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudlinux.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudlinux.com header.i=@cloudlinux.com header.a=rsa-sha256 header.s=google header.b=NsYXFd4w
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-8b0ca1ebc8bso38894837b3.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Nov 2026 06:24:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudlinux.com; s=google; t=1795530287; x=1796135087; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KXE7cnFOP3ln9NR3eVHLPVzp6B5Ml9Wh1PqMmVWUxaw=;
        b=NsYXFd4w1jowqyHVsz+D0NKs5uG9b1AQQZIL27miMJkZX02Uf1ioJfz7iPtRa/QXYo
         iEp036fziKdqn6D6sDQoIZDiJf1sK4CCgmX0UbSUf8l6piP0WhralLuFU6k6GbkIUKtc
         cXlnorAM40+68QjcAh8y9dBdrqMh9gWhSLMmzx5Yf8VMWSr4sTDjwsWD2hqfSx8KUShq
         4LcbcbtuYjTYQL37uNkXyn3YbVBzY0mujKvoq6WL0vm9Klm2i9H4KYihKsm+3PQncqap
         niZVh5pe8g/LRphMUZK3W4xR9a5pioVJJCTSbCPI6zCsbYv+RGIT1A02s5AnoCEAgpBj
         xPLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795530287; x=1796135087;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KXE7cnFOP3ln9NR3eVHLPVzp6B5Ml9Wh1PqMmVWUxaw=;
        b=p0AkVOvUOF+YhY5YdqWZJmbzCf985z8+ixPt4AJxs4xi+CwMFbvDEsphzT165Xqnlj
         7UTUYGNe0VeDo0WjDUSIZI/ViKClxv0SEEZ/sxz67N7U5xMfsoeedmVHI+kjAr7tPd5w
         0UvetpV61SV3sL7OxgDkK9aBuGJ5q0aB1E/o1MQZJFIqBH/emjqv5jwg4R5hOzdIu7Sh
         izJHH/INcQ/IrWJFRUwyUkDmtMOutWtrLO7IU5CvxaA9nXWu4xKEU3qBrkoCFClB3NDf
         vLBALHGCV5gzE3YlSt9k5Rq8RlBDLoG5gjC7VhJDPydQ2x+YSiD0XsyPr8T8ds1hCAvG
         yrcw==
X-Forwarded-Encrypted: i=1; AL+hErG3fUcrDq5RAV/ngDMJuD4j6NttV02fbObA/fUtpE0oGFGtBzt2q+gmZGZ8EaT1sYHstImqZhV+K2KcWsA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/39uLnsSd+dFEKABOAZWfmfJtL6hpY8y4oooNJcXR6ATSQs5Az
	L6guhtI76YoxxfQ5WNzJpT14jz6pK4fZocABEgaj2dIbATHXfmhl6WirqsS1NHWY6NY=
X-Gm-Gg: AZFdTZfoBvYcXVINnba64sEdUW4Ifes/gHsFHLUjzR7+d72LKThLPv/tT7VV38f1p+/
	CX36nMqlmkPH+eaC5z1Lm0zVi4pFM0+ixVPjICPS43RXQqhPtuJ7YHhrywO7ZRGedve/XFl/vj5
	dZ1vAIVEZGozobrWaDYj+uoUHHITPQ7o11kAlsxSiuutr7GmiWxbP17viB31JY96EGp3MO1/GmL
	JGRlsh646tC+GLB5N5baHKtL6XidgJN/pFMfMM1P9EvxI0llXcEJFYKSDahNWYpp9KcrWM/pFmI
	4aqYJRK5pZ2rALX6SIJ4mCvk6xftDt7TKV1ZJ2W7hSUkoP5QSvHbtwnk3NispMPJHoLbghKcSI2
	TJCU8qJjyForWg4reHgzKFSAmz3mTFVtHj0kVuXW+/EFmR9FEoGgmvAMRrQ//ojMbdRBW7NXg/3
	mTPJOmWH2317Zo7x7DXwrqyph9e3gkeGq5UbJJDihhDLsFjYebw/SjhMC2wc+scgaqJtrz1rX6W
	zWG8EClxBt2e37JaEljDP7+5nX3Lr+bRNaHkbxYSGuySCTfY7g0AHjwKAgsnzhq7yXpR4B1E+BX
	rCLfSOoSwWPCaZkWC96iGCqLWU5JwmeTNdxVtw==
X-Received: by 2002:a05:690c:4d47:b0:8b3:22c:b420 with SMTP id 00721157ae682-8b520329516mr63869277b3.5.1795530287265;
        Tue, 24 Nov 2026 06:24:47 -0800 (PST)
Received: from rmustafin-laptop ([27.79.41.63])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b52033c2d4sm58062957b3.36.2026.11.24.06.24.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 06:24:46 -0800 (PST)
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
Date: Tue, 24 Nov 2026 21:24:32 +0700
Message-ID: <20261124142432.368943-3-rmustafin@cloudlinux.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20261124142432.368943-1-rmustafin@cloudlinux.com>
References: <20261124142432.368943-1-rmustafin@cloudlinux.com>
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

Assisted-by: Claude:claude-opus-5-5
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

