function y = svd_compression(M, k)

[U,S,V] = svd(M);
y = U(:,1:k)*S(1:k,1:k)*V(:,1:k)';